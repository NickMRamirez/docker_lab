param(
    [string]$v
)

# Get version of Docker image
if ($v)
{
    $version = $v
}
else 
{
    $version = Read-Host -Prompt 'Enter package version (1.0.0)'
}

if (-Not $version) {
    $version = '1.0.0'
}

$namespace = 'lab'
$image_name = 'app'

Write-Output "Building Docker image ${version}..."

docker build `
  -t ${namespace}/${image_name}:${version} `
  -t ${namespace}/${image_name}:latest `
  --build-arg version_num=${version} `
  --build-arg name=${image_name} . | Out-Null

docker image prune -f --filter label=name=${image_name} | Out-Null

$network_exists = (docker network ls | Select-String "mynet").Length > 0

if (-Not $network_exists)
{
    docker network create mynet
}

# Note that we are NOT exposing a port (6379) on Redis outside of the container network
docker run --rm -d --name myredis --network mynet redis
docker run --rm -d --name myapp -p 3000:3000 --network mynet -e "redis_url=myredis" ${namespace}/${image_name}

Write-Host "`n"
Write-Host "Command: docker exec -it myredis redis-cli"
Write-Host "`n"