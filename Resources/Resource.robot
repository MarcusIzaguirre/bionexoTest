*** Settings ***
Library       Selenium2Library

*** Variables ***
${BROWSER}      chrome
${URL}          https://www.rededorsaoluiz.com.br/

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser    about:blank      ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser

#### Passo a passo de cada STEP

#CENARIO 01
#ok
Dado que estou na página home do site
    Go To               https://www.rededorsaoluiz.com.br/
    Title Should be     Hospitais Rede D'Or São Luiz

Quando eu clicar em "${MARCAR_CONSULTA}"
    Wait Until Element Is Visible     xpath=/html/body/app-root/div/app-rededorsaoluiz/div/main/app-homepage/div/div/div/app-home-ctas/app-home-cta[1]/rdsl-cta/div/a
    Click Element                     xpath=/html/body/app-root/div/app-rededorsaoluiz/div/main/app-homepage/div/div/div/app-home-ctas/app-home-cta[1]/rdsl-cta/div/a

Então mostra a pergunta "${PERGUNTA_TIPO_ATENDIMENTO}"
    Switch Window                    title=Agendamento de Consultas | Rede D'Or São Luiz
    Wait Until Element Is Visible    xpath=//span[@data-qa-id='MedicoEspecialidade_Titulo_Mutavel']
    Title Should Be                  Especialidade / Médico - Agendamento de Consultas | Rede D'Or São Luiz
    Page Should Contain Element      xpath=//span[@data-qa-id='MedicoEspecialidade_Titulo_Mutavel']



#CENARIO 03
#ok
Quando eu clicar em "${MARCAR_EXAME}" exame
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > main > app-homepage > div > div > div > app-home-ctas > app-home-cta:nth-child(2) > rdsl-cta > div > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > main > app-homepage > div > div > div > app-home-ctas > app-home-cta:nth-child(2) > rdsl-cta > div > a

Então mostra a pergunta "${PERGUNTA_EXAME}" tipo exame
    Switch Window                    title=Exame - Agendamento de Exames | Rede D`Or São Luiz
    Wait Until Element Is Visible    css=#app-main > div > app-exame > app-swipe > div > div > div > main > h1
    Title Should Be                  Exame - Agendamento de Exames | Rede D`Or São Luiz
    Page Should Contain Element      css=#app-main > div > app-exame > app-swipe > div > div > div > main > h1



#CENARIO 07
#ok
E clico no menu superior RESULTADO DE EXAMES
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-principal > li:nth-child(5) > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-principal > li:nth-child(5) > a

Quando seleciono a unidade desejada
    Wait Until Element Is Visible    xpath=//select[@name="select"]
    Select From List By Value        xpath=//select[@name="select"]   bangu

Então é mostrado abaixo o quadro da ÁREA DO PACIENTE
    Wait Until Element Is Visible   xpath=//h2
    Page Should Contain Element     xpath=//h2
    Execute Javascript              window.scrollTo(0, 200)
    Scroll Element Into View        xpath=//*[@title='Acessar resultados']

E clico em "${ACESSAR_RESULTADOS}"
    Wait Until Element Is Visible    xpath=//*[@title='Acessar resultados']  timeout=5
    Click Element                    xpath=//*[@title='Acessar resultados']

Então é aberta uma nova aba para fazer o login no sistema
    Switch Window                    title=Área do Paciente - Sua saúde em um só lugar
    Title Should Be                  Área do Paciente - Sua saúde em um só lugar
    Wait Until Element Is Visible    id=btnEntrar
    Page Should Contain Element      id=btnEntrar


#CENARIO 09
#ok
E clico no menu superior direito "Área do Médico"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > a
    Mouse Over                       css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > a

Quando clico em "Resultados de Exames"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > div > ul > li:nth-child(1) > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > div > ul > li:nth-child(1) > a

Então valido a área do médico com a possibilidade de login
    Switch Window                    title=Resultado de exames - Área do Médico
    Title Should Be                  Resultado de exames - Área do Médico
    Wait Until Element Is Visible    css=#__next > div > div.Header_wrapper__1cgXS > div.Header_navbar__1kRlG > div > div > div.Navbar_end__1iJGy > div > div:nth-child(1) > a
    Page Should Contain Element      css=#__next > div > div.Header_wrapper__1cgXS > div.Header_navbar__1kRlG > div > div > div.Navbar_end__1iJGy > div > div:nth-child(1) > a
