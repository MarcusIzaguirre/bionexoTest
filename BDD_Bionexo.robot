*** Settings ***
Resource        ../Resources/Resource.robot
Suite Setup
Test Setup      Abrir navegador
Suite Teardown
Test Teardown   Fechar navegador

### SETUP ->    roda keywords antes de executar todos os testes da suíte ou antes de um teste
### TEARDOWN -> roda keyword depois de uma suite ou um teste

*** Test Case ***

#AUTOMATIZAR
Cenário 01: Validar ação de marcar consulta
    Dado que estou na página home do site
    Quando eu clicar em "Marque uma consulta"
    Então mostra a pergunta "Que tipo de atendimento você está procurando"

Cenário 02: Validar Marcação de consulta
    [Template]  Cenário: Validar Marcação de consulta
    #forma           #convenio    #nomePlano
    PLANO DE SAÚDE   BRADESCO     SAUDE BRADESCO NACIONAL ENFERMARIA

    Dado que estou na página home do site
    Quando eu clicar em "Marque uma consulta"
    Então deve abrir uma nova aba contendo a pergunta "Que tipo de atendimento você está procurando"
    E ao selecionar PRESENCIAL
    E ao buscar uma especialiadade ou médico desejado "Oncologia Clinica"
    E digitar o local onde quero ser atendido "HOSPITAL SÃO LUIZ UNIDADE JABAQUARA" selecionando-o
    E preencho data, sexo e clico em PROSSEGUIR
    Quando seleciono a FORMA DE PAGAMENTO ${#forma}, ${#convenio}, ${#nomePlano} e clico em PROSSEGUIR
    Então valido que o sistema inicia a busca por horário na unidade escolhida
    E que o resultado informou que não existem horários disponíveis
    E que é possivel continuar no chat clicando no botão "CONTINUE ATRAVÉS DO CHAT"

#AUTOMATIZAR
Cenário 03: Validar ação de Marcar Exames
    Dado que estou na página home do site
    Quando eu clicar em "Marque seus exames"
    Então mostra a pergunta "Que tipo de exame você gostaria de marcar?"

Cenário 04: Validar Unidades
    Dado que estou na página home do site
    E clico no menu superior UNIDADES
    Quando preencho as informações desejadas para busca
    Então valido resultado encontrado para o tipo selecionado

Cenário 05: Validar Especialidades
    Dado que estou na página home do site
    E clico no menu superior ESPECIALIDADES
    Quando busco por "Otorrinolaringologia Clínica"
    Então valido as explicações sobre a Especialidade
    E o botão disponível para marcação de consulta "MARCAR CONSULTA"

Cenário 06: Validar Exames e Procedimentos
    Dado que estou na página home do site
    E clico no menu superior EXAMES E PROCEDIMENTOS
    Quando busco por "RESSONÂNCIA MAGNÉTICA ANORRETAL"
    Então valido as explicações sobre o exame
    E o botão disponível para marcação do exame "MARCAR EXAME"

#AUTOMATIZAR
Cenário 07: Validar Resultado de Exames
    Dado que estou na página home do site
    E clico no menu superior RESULTADO DE EXAMES
    Quando seleciono a unidade desejada
    Então é mostrado abaixo o quadro da ÁREA DO PACIENTE
    E clico em "ACESSAR RESULTADOS"
    Então é aberta uma nova aba para fazer o login no sistema

Cenário 08: Validar a busca de um Médico
    Dado que estou na página home do site
    E clico no menu superior "ENCONTRE UM MÉDICO"
    Quando busco pelo nome "IZABELA CRISTINA SOUZA DE ALBUQUERQUE"
    Então valido as informações sobre a médica
    E o botão disponível para marcação de consulta "MARCAR CONSULTA"

#AUTOMATIZAR
Cenário 09: Validar área do Médico
    Dado que estou na página home do site
    E clico no menu superior direito "Área do Médico"
    Quando clico em "Resultados de Exames"
    Então valido a área do médico com a possibilidade de login


# *** Keywords ***
