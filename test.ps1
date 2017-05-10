echo "---------"
echo "contents of docker.compose.yml:"
echo "$((Get-Content docker-compose.yml) -join "`n")"
echo "---------"
echo "value of FOO in shell: ${env:FOO}"
echo "---------"
echo "contents of .env: $(cat .env)"
echo "---------"
echo "contents of .env2: $(cat .env2)"
echo "---------"
docker-compose up -d
$result = docker inspect $(docker ps -lq) -f "{{.Config.Labels.foo}}"
echo "inspecting labels in container using '-f {{.Config.Labels.foo}}'"
echo "---------"
if($result -eq "overridden"){
    write-host -foregroundcolor green "value of Config.Labels.foo: ${result}"
} else {
  write-host -foregroundcolor red "value of Config.Labels.foo: ${result}"
}
echo "---------"
echo "inspected container labels:"
echo "$((docker inspect $(docker ps -lq)) -join "`n")"
echo "---------"
