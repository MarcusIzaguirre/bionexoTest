*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          https://www.rededorsaoluiz.com.br/

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

#### Passo a passo de cada STEP

#CENARIO 01
Dado que estou na página home do site
    Go To               https://www.rededorsaoluiz.com.br/
    Title Should be     Hospitais Rede D´Or São Luiz

Quando eu clicar em "${MARCAR_CONSULTA}"
    Wait Until Element Is Visible     xpath=/html/body/app-root/div/app-rededorsaoluiz/div/main/app-homepage/div/div/div/app-home-ctas/app-home-cta[1]/rdsl-cta/div/a
    Click Element                     xpath=/html/body/app-root/div/app-rededorsaoluiz/div/main/app-homepage/div/div/div/app-home-ctas/app-home-cta[1]/rdsl-cta/div/a

Então mostra a pergunta "${PERGUNTA_TIPO_ATENDIMENTO}"
    Switch Window                   Especialidade / Médico - Agendamento de Consultas | Rede D'Or São Luiz
    Title Should Be                 Especialidade / Médico - Agendamento de Consultas | Rede D'Or São Luiz
    Page Should Contain Element     css=#root > div > div > div.sc-oTmHo.fcqzIr > div > div > div.sc-AxheI.iLhmcR.sc-qQMSE.buBUMj > div > span.sc-AxhUy.mQHKb.sc-pAYXY.bEGtdL

#CENARIO 03
Quando eu clicar em "${MARCAR_EXAME}"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > main > app-homepage > div > div > div > app-home-ctas > app-home-cta:nth-child(2) > rdsl-cta > div > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > main > app-homepage > div > div > div > app-home-ctas > app-home-cta:nth-child(2) > rdsl-cta > div > a

Então mostra a pergunta "${PERGUNTA_EXAME}"
    Switch Window                  Exame - Agendamento de Exames | Rede D`Or São Luiz
    Title Should Be                Exame - Agendamento de Exames | Rede D`Or São Luiz
    Page Should Contain Element    css=#app-main > div > app-exame > app-swipe > div > div > div > main > h1

#CENARIO 07
E clico no menu superior RESULTADO DE EXAMES
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-principal > li:nth-child(5) > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-principal > li:nth-child(5) > a

Quando seleciono a unidade desejada
    Select From List By Value    body > app-root > div > app-rededorsaoluiz > div > main > app-resultado-exames > rdsl-template-content-full > div > rdsl-page-header > header > div.rdsl-page-header-actions > div > app-filtro-unidades > rdsl-select > div > div > select    *values: HOSPITAL BANGU

Então é mostrado abaixo o quadro da ÁREA DO PACIENTE
    Page Should Contain Element    css=body > app-root > div > app-rededorsaoluiz > div > main > app-resultado-exames > rdsl-template-content-full > div > div > section > div > ul.lista-resultados > li > h2

E clico em "${ACESSAR_RESULTADOS}"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > main > app-resultado-exames > rdsl-template-content-full > div > div > section > div > ul.lista-resultados > li > a.bt.resultados
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > main > app-resultado-exames > rdsl-template-content-full > div > div > section > div > ul.lista-resultados > li > a.bt.resultados

Então é aberta uma nova aba para fazer o login no sistema
    Switch Window                    Área do Paciente - Sua saúde em um só lugar
    Title Should Be                  Área do Paciente - Sua saúde em um só lugar
    Wait Until Element Is Visible    id=btnEntrar
    Page Should Contain Element      id=btnEntrar


#CENARIO 09
E clico no menu superior direito "Área do Médico"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > a
    Mouse Over                       css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > a

Quando clico em "Resultados de Exames"
    Wait Until Element Is Visible    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > div > ul > li:nth-child(1) > a
    Click Element                    css=body > app-root > div > app-rededorsaoluiz > div > app-header > header > nav > ul.menu-sec > li.hasSubItem > div > ul > li:nth-child(1) > a

Então valido a área do médico com a possibilidade de login
    Switch Window                    Resultado de exames - Área do Médico
    Title Should Be                  Resultado de exames - Área do Médico
    Wait Until Element Is Visible    css=#__next > div > div.Header_wrapper__1cgXS > div.Header_navbar__1kRlG > div > div > div.Navbar_end__1iJGy > div > div:nth-child(1) > a
    Page Should Contain Element      css=#__next > div > div.Header_wrapper__1cgXS > div.Header_navbar__1kRlG > div > div > div.Navbar_end__1iJGy > div > div:nth-child(1) > a

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait Until Element Is Visible       css=#root > div > div > div.sc-oTmHo.fcqzIr > div > div > div.sc-AxheI.iLhmcR.sc-qQMSE.buBUMj > div > span.sc-AxhUy.mQHKb.sc-pAYXY.bEGtdL
    Title Should Be                     Hospitais Rede D´Or São Luiz
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class='product-name'][contains(text(),"Blouse")]



Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       css=#center_column > p
    Element Text Should Be              css=#center_column > p      ${MENSAGEM_ALERTA}

E passo o mouse por cima da categoria "${CATEGORIA}"
    Wait Until Element is Visible   css=#block_top_menu > ul > li:nth-child(1) > a
    Mouse Over                      css=#block_top_menu > ul > li:nth-child(1) > a

Quando clico na sub categoria "${CATEGORIA}"
    Title Should Be                 Summer Dresses
    Page Should Contain Link        xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Então uma página com os produtos da categoria selecionada deve ser exibida
    Wait Until Element Is Visible       css=#layered_block_left > p
    Element Text Should Be              css=#layered_block_left > p
