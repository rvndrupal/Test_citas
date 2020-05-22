***Settings***
Library     SeleniumLibrary
#Library     Selenium2Library
Library     String
Library     ReadData.py   #Para poder ller los datos de excel

***Variables***
#${navegador}    chrome
#${url}         http://automationpractice.com/index.php
#${url}         https://www.amazon.com.mx/?ref=icp_country_us_t1
#${url}          http://www.practiceselenium.com/practice-form.html
#${url}          http://demowebshop.tricentis.com/register
#C:/Python/robotframework/amtif/test_uno/result_uno/result_uno/img/Captura.png
${dir}      Img


***Keywords***

Abrir setup
    [Arguments]     ${url}  ${nav}
    Abrir navegador  ${url}   ${nav}   
    Maximizar

Cerrar setup
    Cerrar Todos


Abrir navegador
    [Arguments]     ${arg1}   ${arg2}
    Open Browser    ${arg1}   ${arg2}



Abrir navegador2
    Open Browser    ${url2}   ${navegador}
   

Cerrar
    Close Browser

Ventana
    [Arguments]     ${arg1}     ${arg2}
    Set Window Size     ${arg1}     ${arg2}

Maximizar
    Maximize Browser Window

Tiempo
    [Arguments]     ${arg1}     
    Set Selenium Speed     ${arg1} seconds


Focus 
    [Arguments]    ${arg1}    
    Set Focus To Element    xpath=${arg1}

Click
    [Arguments]    ${arg1}
    Click Element   xpath=${arg1}

Click id
    [Arguments]    ${arg1}
    Click Element   id=${arg1}


Click IE
    [Arguments]    ${arg1}
    Click Link      id=${arg1}

Limpiar
    [Arguments]    ${arg1}
    Clear Element Text   xpath=${arg1}

Visible
    [Arguments]    ${arg1}
    Wait Until Element is Visible   xpath=${arg1}

Visible2
    [Arguments]    ${arg1}  
    Element Should Be Visible   xpath=${arg1}    

NoVisible
    [Arguments]    ${arg1}
    Element Should Not Be Visible   xpath=${arg1}

Texto
    [Arguments]    ${arg1}  ${arg2}
    Input Text   xpath=${arg1}    ${arg2}

Texto Vacio
    [Arguments]    ${arg1}  
    Input Text   xpath=${arg1}    ""


Obtener
    [Arguments]    ${xpath}  
    Get Value   xpath=${xpath}    

Obtener dos
    [Arguments]    ${texto}  
    Wait Until Page Contains    ${texto}    


Titulo
    [Arguments]    ${arg1}
    Title Should Be    xpath=${arg1} 

Dormir
    [Arguments]    ${arg1}
    sleep       ${arg1} 

Dormir Todos
    [Arguments]    ${arg1}
    set selenium speed    ${arg1} seconds

Print
    [Arguments]    ${arg1}
    log to console    ${arg1} 

Print Variable
    [Arguments]    ${var}
    Log    ${var} 

Esperar Objeto
    [Arguments]    ${arg1}
    Wait Until Page Contains    ${arg1} 

Esperar Iniciar ok
    [Arguments]    ${arg1}
    Set Selenium Timeout    ${arg1} seconds

Esperar Iniciar Forzar
    [Arguments]    ${arg1}
    Set Selenium Implicit Wait    ${arg1} seconds

Alerta ok
    #[Arguments]   ${arg1}
    Handle Alert    accept

Alerta texto
    [Arguments]   ${arg1}
    Alert Should Be Present    ${arg1}

    

Alerta cancel
    #[Arguments]   ${arg1}
    Handle Alert    dismiss

Sel Window
    [Arguments]   ${arg1}
    Select Window    ${arg1}

Switch Ventana
    [Arguments]     ${arg1}
    Switch Browser      ${arg1}

Obtener Titulo
    ${titulo}=      Get Title 
    [Return]     ${titulo}   

Pantalla
    [Arguments]     ${arg1}
    Capture Page Screenshot     ${arg1}


Login uno
    Texto    (//input[contains(@type,'text')])[1]   erojasc14760  
    Texto    (//input[@class='form-control'])[2]    sena2o14
    Pantalla     ${dir}/Loguno.png 
    Click     //input[@type='submit']

Login Tif
    Texto       (//input[contains(@id,'tif')])[1]     A-124
    Texto       //input[contains(@type,'password')]    sen962fitA-124
    Pantalla         ${dir}/Tif.png
    Click       (//input[contains(@type,'submit')])[2]
    
    



Scroll
    [Arguments]   ${arg1}   ${arg2}
    execute javascript      window.scrollTo(${arg1},${arg2})

Examinar
    [Arguments]   ${arg1}   ${arg2}
    Choose File     ${arg1}     ${arg2}

    


Video Iniciar
    Start Video Recording

Video Finalizar
    Stop Video Recording


Resultado
    [Arguments]   ${tiempo}   ${dir}    ${print}
    sleep       ${tiempo}   
    Capture Page Screenshot     ${dir}
    Log    ${print} 

Tabulador
    [Arguments]     ${key}
    Press Keys    ${key}    TAB



Limpiar Texto
    [Arguments]    ${xpath}
    Clear Element Text    xpath=${xpath} 


Continuar 
    Print  OK continuo

Cerrar Todos
    Dormir  .5
    Close All Browsers

Cambiar navegador
    [Arguments]     ${nav}
    go to     ${nav}

Regresar navegador
    go back


######### Opciones del Mause ****************
Menu emergente
    [Arguments]     ${xpath}
    Open Context Menu   ${xpath}

Doble click
    [Arguments]     ${xpath}
    Double Click Element   ${xpath}

Mause down
    [Arguments]     ${xpath}
    Mouse Down   ${xpath}

    

#############################################

############ Opciones del Teclado #############
Texto enter
    [Arguments]   ${xpath}   
    Press Key     ${xpath}    \\13


Texto tab
    [Arguments]   ${xpath}   
    Press Key     ${xpath}    \\9

##############################################

######### Verificar elementos ###############
Verificar texto
    [Arguments]   ${poner_texto}   ${tiempo} 
    Wait Until Page Contains    ${poner_texto}    ${tiempo}

Verificar elemento
    [Arguments]   ${xpath}   ${tiempo} 
    Wait Until Page Contains Element    ${xpath}    ${tiempo}

	

#############################################

Obtener Url   
    ${url}     Get Location  
    [Return]    ${url}
        
   

# If
#     [Arguments]     ${arg1}     ${arg2}     ${arg3}
#     Run Keyword if      '${arg1}'=='${arg2}'  ${arg3}

#Opciones del Raton
##################################
Mause over
    [Arguments]    ${arg1}
    Mouse Over   xpath=${arg1}

   
###################################


#################################
#Select radio
SR
    [Arguments]    ${arg1}  ${arg2}
    Select Radio Button   ${arg1}   ${arg2}

#Select checkbox
SC
    [Arguments]    ${arg1}  
    Select Checkbox	   ${arg1}  

USC
    [Arguments]    ${arg1}  
    Unselect Checkbox   ${arg1}  

##########Select lista #################
SLI
    [Arguments]    ${arg1}  ${arg2}
    Select From List By Index   ${arg1}     ${arg2}
SLL
    [Arguments]    ${arg1}  ${arg2}
    Select From List By Label   ${arg1}    ${arg2}


Obtener valor lista Etiqueta
    [Documentation]     Obtener el valor de la lista por etiqueta xpath
    [Arguments]     ${xpath}
    ${val}=     Get Selected List Label   ${xpath}
    [Return]    ${val}

Obtener valor lista Index
    [Documentation]     Obtener el valor de la lista por Indice xpath
    [Arguments]     ${xpath}
    ${val}=     Get Selected List Value   ${xpath}
    [Return]    ${val}

Obtener todos los valores de la Lista
    [Documentation]     Obteniendo todos los valores de la lista  xpath
    [Arguments]     ${xpath}
    ${val}=     Get List Items  ${xpath}
    [Return]    ${val}



    
#################################

SF
    #SELECCIONAR UN IFRAME
    [Arguments]    ${arg1}
    Select Frame   ${arg1}

USF
    #DESELECCIONAR IFRAME ES IMPORTANTE PARA CIERRE
    Unselect Frame

Comparar
    #Compara dos valores  que se pasan 
    [Arguments]    ${arg1}  ${arg2}
    Element Text Should Be   ${arg1}  ${arg2}

######################
# checar el de tiempo  Wait Until Keyword Succeeds 
    

######## VALIDAR CAMPOS #####################

Validar Texto
    [Arguments]     ${texto}
    Page Should Contain	    ${texto}

Validar campo texto
    [Arguments]     ${xpath_campo}
    Page Should Contain Textfield   ${xpath_campo}

Validar Boton
    [Arguments]     ${xpath_buton}
    Page Should Contain Button      ${xpath_buton}

Validar checkbox
    [Arguments]     ${xpath_checkbox}   ${mensaje}
    Page Should Contain Checkbox        ${xpath_checkbox}       ${mensaje}

Validar imagen
    [Arguments]     ${xpath_imagen}   ${mensaje}
    Page Should Contain Image        ${xpath_imagen}       ${mensaje}

Validar tener texto
    [Arguments]     ${xpath_texto}   ${comparar}    ${mensaje}
    Element Should Contain    ${xpath_texto}    ${comparar}    ${mensaje}

Validar titulo
    [Arguments]     ${titulo}   
    Title Should Be     ${titulo}


Validar elemento Disable
    [Arguments]     ${xpath}   
    Element Should Be Disabled      ${xpath}
    [Return]    Desactivado
    
    

Validar elemento Enabled
    [Arguments]     ${xpath}   
    Element Should Be Enabled      ${xpath}
    [Return]    Activado


Validar elemento Focus
    [Arguments]     ${xpath}   
    Element Should Be Focused      ${xpath}

######## VALIDAR CAMPOS #####################

##########Obtener Valores##################

Obtener Value
    [Documentation]     Obtener el valor de una campo o variable
    [Arguments]     ${xpath}
    ${val}=     Get Value   ${xpath}
    [Return]    ${val}

Obtener Text
    [Documentation]     Obtener el texto de la variable xpath
    [Arguments]     ${xpath}
    ${val}=     Get Text   ${xpath}
    [Return]    ${val}


##########Obtener Valores##################

######### LEER CAMPOS EXCEL ###############
Leer numero de filas
    [Arguments]   ${hoja} 
    ${maxr}=    numero_de_filas     ${hoja} 
    [Return]    ${maxr}

Leer celda
    [Arguments]     ${hoja}     ${fila}     ${celda}
    ${celldata}=   cell_data     ${hoja}     ${fila}      ${celda}
    [Return]    ${celldata}



######### LEER CAMPOS EXCEL ###############











    