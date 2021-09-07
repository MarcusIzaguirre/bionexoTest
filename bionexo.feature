Funcionalidade: Hospitais - Rede São Luiz

#CENÁRIO 01
#AUTOMATIZAR
Cenário: Validar ação de marcar consulta
    Dado que estou na página home do site
    Quando eu clicar em "Marque uma consulta"
    Então mostra a pergunta "Que tipo de atendimento você está procurando"


#CENÁRIO 02
Esquema do Cenário: Validar Marcação de consulta
    Dado que estou na página home do site
    Quando eu clicar em "Marque uma consulta"
    Então deve abrir uma nova aba contendo a pergunta "Que tipo de atendimento você está procurando"
    E ao selecionar PRESENCIAL
    E ao buscar uma especialiadade ou médico desejado "Oncologia Clinica"
    E digitar o local onde quero ser atendido "HOSPITAL SÃO LUIZ UNIDADE JABAQUARA" selecionando-o
    E preencho data, sexo e clico em PROSSEGUIR
    Quando seleciono a FORMA DE PAGAMENTO <forma>, <convenio>, <nomePlano> e clico em PROSSEGUIR
    Então valido que o sistema inicia a busca por horário na unidade escolhida
    E que o resultado informou que não existem horários disponíveis
    E que é possivel atendimento no chat clicando no botão "CONTINUE ATRAVÉS DO CHAT" 
    

Exemplos:
|forma            | convenio   | nomePlano                            |
|"PLANO DE SAÚDE" | "BRADESCO" | "SAUDE BRADESCO NACIONAL ENFERMARIA" |
|"PARTICULAR"     |  


#CENÁRIO 03
#AUTOMATIZAR
Cenário: Validar ação de Marcar Exames
    Dado que estou na página home do site
    Quando eu clicar em "Marque seus exames"
    Então deve abrir uma nova aba contendo a pergunta "Que tipo de exame você gostaria de marcar?"


#CENÁRIO 04
Cenário: Validar Unidades
    Dado que estou na página home do site
    E clico no menu superior UNIDADES
    Quando preencho as informações desejadas para busca
    Então valido resultado encontrado para o tipo selecionado

#CENÁRIO 05
Cenário: Validar Especialidades
    Dado que estou na página home do site
    E clico no menu superior ESPECIALIDADES
    Quando busco por "Otorrinolaringologia Clínica"
    Então valido as explicações sobre a Especialidade
    E o botão disponível para marcação de consulta "MARCAR CONSULTA"      

#CENÁRIO 06
Cenário: Validar Exames e Procedimentos
    Dado que estou na página home do site
    E clico no menu superior EXAMES E PROCEDIMENTOS
    Quando busco por "RESSONÂNCIA MAGNÉTICA ANORRETAL"
    Então valido as explicações sobre o exame
    E o botão disponível para marcação do exame "MARCAR EXAME"  


#CENÁRIO 07
Cenário: Validar Resultado de Exames
    Dado que estou na página home do site
    E clico no menu superior RESULTADO DE EXAMES
    Quando seleciono a unidade desejada
    Então é mostrado abaixo o quadro da ÁREA DO PACIENTE
    E clico em "ACESSAR RESULTADOS"
    Então é aberta uma nova aba para que eu faça o login no sistema


#CENÁRIO 08
Cenário: Validar a busca de um Médico
    Dado que estou na página home do site
    E clico no menu superior "ENCONTRE UM MÉDICO"
    Quando busco pelo nome "IZABEL CRISTINA SOUZA DE ALBUQUERQUE"
    Então valido as informações sobre o médica
    E o botão disponível para marcação de consulta "MARCAR CONSULTA"      