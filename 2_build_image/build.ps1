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

Write-Output "`n"
Write-Output "Image created"
Write-Output "--> ${namespace}/${image_name}:${version}" 
Write-Output "--> ${namespace}/${image_name}:latest"
Write-Output "`n"
Write-Output "Usage:"
Write-Output "docker run --rm -d --name myapp -p 3000:3000 ${namespace}/${image_name}"
Write-Output "`n"