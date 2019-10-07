## Script verifica em mais de um servidor se os recursos do System Insights (Informações do Sistema) estão habilitados - Créditos Gabriel Luiz - www.gabrielluiz.com ##

$Computers = @(“ADDS.contoso.local", “DHCP.contoso.local")
$Statuses = foreach ($Computer in $Computers) {
$Computer
$DisabledCapabilities = (Get-InsightsCapability -ComputerName $Computer | where State -eq "Disabled").Name 
foreach ($Capability in $DisabledCapabilities) {
Get-InsightsCapabilityResult -Name $Capability -ComputerName $Computer | select *
}
}
$Statuses

# Explicação do comando.

# O campo $Computers adicione os hostnames dos servidores que são verificados.

# Esse script apresenta todas as informações dos recursos habilitados de dois servidores de uma só vez, demostrando o status, horário de agendamento e recurso do System Insights (Informações do Sistema).

# Para melhor compreensão dos comandos apresentados acesse o link do artigo.

# https://gabrielluizbh.hostingerapp.com/2019/10/system-insights