## Script dos comandos System Insights (Informações do Sistema) - Créditos Gabriel Luiz - www.gabrielluiz.com ##


Add-WindowsFeature System-Insights -IncludeManagementTools # Instala o recurso System Insights.


Get-InsightsCapability # Verifica se todos os System Insights estão ativados ou desabilitados.

Enable-InsightsCapability -Name "CPU capacity forecasting" # Habilita análise da CPU.

Disable-InsightsCapability -Name "Networking capacity forecasting" # Desabilita a análise da Rede.


Get-InsightsCapabilityResult # Verifica os resultados, será necessário escolher qual dado você quer analisar. 

# Previsão de capacidade da CPU. 

CPU capacity forecasting 

Get-InsightsCapabilityResult -Name "CPU capacity forecasting" -History # Verifica os últimos 30 resultados da previsão.


Get-InsightsCapabilitySchedule # Verifica os agendamentos. 

# Previsão de capacidade da CPU. 

CPU capacity forecasting


Get-InsightsCapability # Verifica todos os recursos das informações do sistema e os seus status.


Get-InsightsCapability | Get-InsightsCapabilitySchedule # Mostra todos os recursos habilitados, os seus status e os agendamentos de recursos.

Enable-InsightsCapabilitySchedule # Habilita o agendamento. 

# Previsão de consumo de volume.

Volume consumption forecasting

Disable-InsightsCapabilitySchedule # Desabilita o agendamento. 

# Previsão de capacidade da CPU. 

CPU capacity forecasting

Disable-InsightsCapabilitySchedule -Name "Volume consumption forecasting" # Desabilita o agendamento de recurso para o volume.


Set-InsightsCapabilitySchedule -Name "CPU capacity forecasting" -Daily -DaysOfWeek Monday, Tuesday, Wednesday, Thursday, Friday -At 03:00 # Define uma programação diária para o recurso de previsão de capacidade da CPU, que é executado todos os dias da semana às 3h.

Set-InsightsCapabilitySchedule -Name "CPU capacity forecasting" -Daily -DaysInterval 2 # Define uma programação diária para o recurso de previsão de capacidade da CPU, que é executado a cada 2 dias.

Set-InsightsCapabilitySchedule -Name "CPU capacity forecasting" -Hourly -HoursInterval 4 -DaysOfWeek Tuesday, Friday # Define uma programação para o recurso de previsão de capacidade da CPU, que é executado a cada 4 horas na terça e na sexta-feira.

Set-InsightsCapabilitySchedule -Name "CPU Capacity Forecasting" -DefaultSchedule # Restaura a programação padrão do recurso de previsão de capacidade da CPU.


$Cred = Get-Credential

Set-InsightsCapabilityAction -Name "Volume consumption forecasting" -Type Critical -Action "C:\Users\Public\CriticalActionVolume.ps1" -ActionCredential $Cred # Este comando executa um script quando a uma alerta crítico em um volume do servidor.


$Cred = Get-Credential

Set-InsightsCapabilityAction -Name "CPU capacity forecasting" -Type Warning -Action "C:\Users\Public\WarningAction.ps1" -ActionCredential $Cred # Este comando executa um script quando a uma ação de aviso para o recurso de previsão de capacidade da CPU.


#Observação: Para melhor compreensão dos comandos apresentados acesse o link do artigo.

# https://gabrielluizbh.hostingerapp.com/2019/10/system-insights