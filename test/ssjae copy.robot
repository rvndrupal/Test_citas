***Settings***
Documentation   Casos de Prueba  Proyecto SSJAE
Library     String
Library     ScreenCapLibrary
Library     DateTime
Resource    ./recursos.robot
Resource    ./casos.robot
Library     FakerLibrary



#robot -d resultados -i ss04  ssjae.robot
#robot -d resultados -i rd01 -i rd02  -v navegador:firefox  test.robot
#robot -d resultados  test.robot
#Vinr770919hdfltd00
#robot -d resultados  tes*.robot
#pabot --processes 20 --outputdir resultados_uno  TEST/test*.robot
#pabot --processes 4 --outputdir  resultados_multiples  ssjae*.robot

#excel con pabot


***Variables***
#${url}          http://10.16.3.29/login
${url}          https://dessistemas.senasica.gob.mx/SSJAEWeb/login.xhtml
${navegador}    chrome
${tiempo}   .1

#user         olivia.rodriguez
#Password     senades2020


*** Keywords ***

    

*** Test Cases ***
# CC001 SSJAE (SISTEMA SSJAE 001)(HAPPY PATH)
#     [Documentation]    PRUEBA SSJAE 001 (HAPPY PATH) 
#     [Tags]      ss01   
#     Esperar Iniciar ok    15  
#     Video Iniciar  
#     Login   ${url}  ${navegador}
#     Calendario
#     # Catalagos Categorías
#     # Catalogos Organizaciones
#     # Catalogos Representantes
#     Agregar
#     Mostrar evento
#     Video Finalizar
#     Cerrar

# CC002 SSJAE (SISTEMA SSJAE 002)(VERSIÓN COMPLETA )
#     [Documentation]    PRUEBA SSJAE 002 (VERSIÓN COMPLETA) 
#     [Tags]      ss02   
#     Esperar Iniciar ok    15  
#     Video Iniciar  
#     Login   ${url}  ${navegador}
#     Calendario
#     Catalagos Categorías
#     Catalogos Organizaciones
#     Catalogos Representantes
#     Agregar
#     Mostrar evento
#     Video Finalizar
#     Cerrar

# *** Test Cases ***
# CC003 SSJAE (SISTEMA SSJAE 003)(Categorías)
#     [Documentation]    PRUEBA SSJAE 003 (Carga Categorías) 
#     [Tags]      ss03
#     Esperar Iniciar ok    15  
#     #Video Iniciar  
#     Login   ${url}  ${navegador}
#     #Calendario
#     Catalagos Categorías Excel
#     # Catalogos Organizaciones
#     # Catalogos Representantes
#     #Agregar
#     #Mostrar evento
#     #Video Finalizar
#     Cerrar

*** Test Cases ***
CC004 SSJAE (SISTEMA SSJAE 004)(HAPPY PATH EXCEL)
    [Documentation]    PRUEBA SSJAE 004 (HAPPY PATH EXCEL) 
    [Tags]      ss04
    Esperar Iniciar ok    25  
    Video Iniciar  
    Login   ${url}  ${navegador}
    Calendario
    Catalagos Categorías Excel
    # Catalogos Organizaciones
    Catalogos Organizaciones Excel
    # Catalogos Representantes
    Catalogos Representantes Excel
    Agregar Excel
    #Mostrar evento
    Video Finalizar
    Cerrar


   
    
    

