***Settings***
Documentation   Casos de Prueba  CC-04-2019-AMTIF-OT04
Library     String
Library     ScreenCapLibrary
Library     DateTime
Resource    recursos.robot
Resource    ./casos.robot
Library     FakerLibrary
Library     Dialogs



#robot -d resultados -i tg01  test_if.robot
#robot -d resultados -i rd01 -i rd02  -v navegador:firefox  test.robot
#robot -d resultados  test.robot
#Vinr770919hdfltd00
#robot -d resultados  tes*.robot
#pabot --processes 5 -i tg12 --outputdir resultados_uno  test*.robot
#pabot --processes 7 -i tg10 -d results  test*.robot


***Variables***
#${url}          http://10.16.3.29/login
${url}          http://10.16.3.29/login/init
${navegador}    chrome
${tiempo}   .1
${dir}      Tramites
${dir2}      Aviso



${pdf1}     C:\\pdf\\pdf1.pdf
${pdf2}     C:\\pdf\\pdf2.pdf

      
${key}      C:\\ClavePrivada.key
${Cer}      C:\\vinr770919lc8.cer

#${claverfc}     TLHC840918FW7

*** Keywords ***
Aleatorio claverfc
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    ${text} =    Generate Random String  2  [UPPER]
    ${inc} =    Generate Random String  3  [UPPER]
    ${num} =    Generate Random String  1  [NUMBERS]            
    [Return]     ${inc}C840918${text}${num}

Aleatorio claverfc2
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    ${text} =    Generate Random String  2  [UPPER]
    ${inc} =    Generate Random String  3  [UPPER]
    ${num} =    Generate Random String  1  [NUMBERS]            
    [Return]     ${inc}D720918${text}${num}

Aleatorio Curp
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    ${tex} =    Generate Random String  2  [UPPER]
    ${num} =    Generate Random String  2  [NUMBERS]
    [Return]     GARM810919HDflTD${num}
    	
    

*** Test Cases ***
CC00 SOLICITUD DE VARIABLES
    [Documentation]    Solicitud de Variables
    [Tags]      tg00
    ${navegador}=     Get Value From User     Navegador:    default_value=chrome  


CC001 TRAMITES-0T4 (TRAMITES 018 A)(CHROME LOGIN)
    [Documentation]    PRUEBA TRAMITE 018 A  (Login) 
    [Tags]      tg01   
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Cerrar

CC002 TRAMITES-0T4 (TRAMITES 018 A)(CHROME TRAMITE)
    [Documentation]    PRUEBA TRAMITE 018 A  
    [Tags]      tg02   
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}=      YNXC840918PQ7
    #Datos Personales     ${claverfc} 
    # ${Opciones}=     Get Value From User     Numero de Opciones:    default_value=1  
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Cerrar


CC003 TRAMITES-0T4 (TRAMITES 018 A)(CHROME ACTIVIDAD ECONÓMICA)
    [Documentation]    PRUEBA TRAMITE 018 A  ACTIVIDAD ECONÓMICA
    [Tags]      tg03   
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica  
    Cerrar

CC004 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DOMICILIO FISCAL)
    [Documentation]    PRUEBA TRAMITE 018 A  DOMICILIO FISCAL
    [Tags]      tg04  
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Cerrar

CC005 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DOMICILIO PLANTA)
    [Documentation]    PRUEBA TRAMITE 018 A  DOMICILIO PLANTA
    [Tags]      tg05  
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Cerrar


CC006 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DOMICILIO ALMACÉN)
    [Documentation]    PRUEBA TRAMITE 018 A  DOMICILIO ALMACÉN
    [Tags]      tg06 
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Domicilio del Almacen
    Cerrar


CC007 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DATOS REPRESENTANTE LEGAL)
    [Documentation]    PRUEBA TRAMITE 018 A  DATOS REPRESENTANTE LEGAL
    [Tags]      tg07 
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Domicilio del Almacen
    ${claverfc2} =    Aleatorio claverfc2
    Log     ${claverfc2}       
    #Datos del Representante Legal    ${claverfc2}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos del Representante Legal    ${claverfc2}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Cerrar

CC008 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DATOS DATOS ADICIONALES)
    [Documentation]    PRUEBA TRAMITE 018 A  DATOS DATOS ADICIONALES
    [Tags]      tg08 
    Esperar Iniciar ok    15  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Domicilio del Almacen
    ${claverfc2} =    Aleatorio claverfc2
    Log     ${claverfc2}       
    #Datos del Representante Legal    ${claverfc2}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos del Representante Legal    ${claverfc2}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Clave del medico veterinario
    Cerrar

CC009 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DATOS DOCUMENTOS ANEXOS)
    [Documentation]    PRUEBA TRAMITE 018 A  DATOS DOCUMENTOS ANEXOS
    [Tags]      tg09 
    Esperar Iniciar ok    30  
    #Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Domicilio del Almacen
    ${claverfc2} =    Aleatorio claverfc2
    Log     ${claverfc2}       
    #Datos del Representante Legal    ${claverfc2}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos del Representante Legal    ${claverfc2}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Clave del medico veterinario    
    Documentos Anexos
    Cerrar

CC010 TRAMITES-0T4 (TRAMITES 018 A)(CHROME DATOS FIRMA ELECTRONICA)
    [Documentation]    PRUEBA TRAMITE 018 A  DATOS FIRMA ELECTRONICA
    [Tags]      tg10
    Esperar Iniciar ok    30  
    Video Iniciar
    ${claverfc} =    Aleatorio claverfc
    Log     ${claverfc} 
    Login   ${url}   ${navegador}
    Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos Personales     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Actividad Economica 
    Datos Domicilio Fiscal 
    Domicilio de la Planta
    Domicilio del Almacen
    ${claverfc2} =    Aleatorio claverfc2
    Log     ${claverfc2}       
    # Datos del Representante Legal    ${claverfc2}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${val}=     Run Keyword And Return Status  Datos del Representante Legal    ${claverfc2}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop
    Clave del medico veterinario    
    Documentos Anexos
    Sin Firma
    Video Finalizar
    Cerrar






 
#INICIA EL FLUJO INTERNO
CC001 TRAMITES-0T07 (TRAMITES OTO7)(CHROME REASIGNACIÓN DE DICTAMEN) 
    [Documentation]    TRAMITES OTO7  REASIGNACIÓN DE DICTAMEN
    [Tags]      rd01
    Esperar Iniciar Forzar  10 
    #Video Iniciar
    Login2  ${url}  ${navegador}   norma.miguel    test123$
    Resultado  1  ${dir}/Rdictamen.png  Entrando reasignación dictamen
    Scroll  0  100
    Dormir  1.5
    Scroll  0  300
    Click  (//input[contains(@type,'checkbox')])[1]
    Dormir  1
    Scroll  0  1000
    Dormir     1
    Click  (//button[@class='btn btn-primary'])[1]
    Resultado  1  ${dir}/RAsignar.png  Asignando
    Click  (//input[contains(@name,'optradio')])[3]
    Click   (//button[contains(@data-dismiss,'modal')])[2]
    Resultado  1  ${dir}/RAsignacionok.png  Asignando ok
    Dormir  4
    Cerrar

CC002 TRAMITES-0T07 (TRAMITES OTO7)(CHROME REASIGNACIÓN DE DICTAMEN PRUEBA-04) 
    [Documentation]    TRAMITES OTO7  REASIGNACIÓN DE DICTAMEN PRUEBA-04
    [Tags]      rd02
    Esperar Iniciar Forzar  10 
    #Video Iniciar
    Login2  ${url}  ${navegador}   norma.miguel    test123$
    Resultado  1  ${dir}/Rdictamen.png  Entrando reasignación dictamen
    Scroll  0  200
    Dormir  3
    Click  //select[@class='form-control ng-untouched ng-pristine ng-valid']
    Dormir  1.5
    Click  /html/body/app-root/app-consulta-solicitudes/main/div/div[1]/div[1]/div/select/option[2]
    Dormir    1.5
    Click  (//a[contains(@data-target,'#modalReAsignacion')])[1]
    Dormir     1
    Click  (//input[contains(@name,'optradio')])[2]
    Dormir      1
    Click  (//button[@class='btn btn-primary'][contains(.,'Aceptar')])[2]
    Dormir      4
    Cerrar




######## Disparar multiples test##################
CC011 TRAMITES-0T4 (TRAMITES 018 A)(CHROME MULTIPLES TEST)
    [Documentation]    PRUEBA TRAMITE 018 A MULTIPLES TEST
    [Tags]      tg11    
    ${Eventos}=     Get Value From User     Numero de Test a Probar:    default_value=1
    Log     ${Eventos}
    : FOR    ${INDEX}    IN RANGE    1    ${Eventos}
    \   Global multiples casos
    \   Resultado   1   ${dir}/Terminan_casos.png   Termina los casos
    


########### TEST CON VALORES DESDE EXCEL ###############
CC011 TRAMITES-0T4 (TRAMITES 018 A)(VALORES DESDE EXCEL)
    [Tags]  tg12
    [Documentation]     Obtener valores desde hoja de Excel
    Esperar Iniciar ok    30  
    # Video Iniciar
    # ${claverfc} =    Aleatorio claverfc
    # Log     ${claverfc} 
    # Login   ${url}   ${navegador}
    # Tramite
    #Datos Personales    ${claverfc}
    : FOR    ${INDEX}    IN RANGE    1    1000
    \   ${claverfc} =    Aleatorio claverfc
    \   Log     ${claverfc} 
    \   Login   ${url}   ${navegador}
    \   Tramite
    \   ${val}=     Run Keyword And Return Status  Datos Personales Excel     ${claverfc}
    \   Log     ${val}
    \   Dormir  1
    \   Run Keyword If  '${val}'=='True'     Exit For Loop

    ${rows}=   Leer numero de filas  Hoja1

    : FOR  ${i}  IN RANGE     1  ${rows}+1
    \   ${nombre}=   Leer celda  Hoja1  ${i}  1
    \   ${ap}=   Leer celda  Hoja1  ${i}  2
    \   ${am}=   Leer celda  Hoja1  ${i}  3
    \   ${lada}=   Leer celda  Hoja1  ${i}  4
    \   ${tel_fijo}=   Leer celda  Hoja1  ${i}  5
    \   ${extension}=   Leer celda  Hoja1  ${i}  6
    \   ${fax}=   Leer celda  Hoja1  ${i}  7
    \   ${email_uno}=   Leer celda  Hoja1  ${i}  8
    \   ${email_dos}=   Leer celda  Hoja1  ${i}  9
    \   ${actividad}=   Leer celda  Hoja1  ${i}  10
    \   Log     ${actividad}
    \   ${materia}=   Leer celda  Hoja1  ${i}  11
    \   ${funcion}=   Leer celda  Hoja1  ${i}  12
    \   ${cp}=   Leer celda  Hoja1  ${i}  13
    \   ${colonia}=   Leer celda  Hoja1  ${i}  14
    \   ${calle}=   Leer celda  Hoja1  ${i}  15
    \   ${nexterior}=   Leer celda  Hoja1  ${i}  16
    \   ${ninterior}=   Leer celda  Hoja1  ${i}  17
    \   ${cp2}=   Leer celda  Hoja1  ${i}  18
    \   ${colonia2}=   Leer celda  Hoja1  ${i}  19
    \   ${calle2}=   Leer celda  Hoja1  ${i}  20
    \   ${nexterior2}=   Leer celda  Hoja1  ${i}  21
    \   ${ninterior2}=   Leer celda  Hoja1  ${i}  22
    \   Texto   (//input[contains(@formcontrolname,'nombre')])[1]  ${nombre}
    \   Texto   (//input[contains(@formcontrolname,'primerApellido')])[1]  ${ap}
    \   Texto   (//input[contains(@formcontrolname,'segundoApellido')])[1]  ${am}
    \   Texto   (//input[contains(@formcontrolname,'lada')])[1]  ${lada}
    \   Texto   (//input[contains(@placeholder,'Teléfono fijo')])[1]  ${tel_fijo}
    \   Texto   (//input[contains(@type,'text')])[8]  ${extension}
    \   Texto   (//input[contains(@type,'text')])[9]  ${fax}
    \   Texto   (//input[contains(@formcontrolname,'correoElectronico')])[1]  ${email_uno}
    \   Texto   (//input[contains(@placeholder,'ejemplo@dominio.com')])[2]  ${email_dos}
    \   Esperar Iniciar Forzar    10
    \   Scroll  0  1000
    \   SLL     //body[contains(@class,'pace-done')]//div[@id='Formulario']//div//div//div[1]//div[1]//select[1]    ${actividad}
    \   Dormir  .3
    \   SLL     //app-actividad-economica//div[2]//div[1]//select[1]        ${materia}
    \   Dormir    .3
    \   SLL     //select[contains(@formcontrolname,'funcion')]        ${funcion}
    \   Dormir      .8
    \   Texto   (//input[@autocomplete='NÑp'])[1]   ${cp}    
    \   Tabulador   (//input[@autocomplete='NÑp'])[1]
    \   Dormir    1
    \   SLL     (//select[contains(@formcontrolname,'colonia')])[1]        ${colonia}
    \   Texto   (//input[contains(@formcontrolname,'calle')])[1]      ${calle}
    \   Texto   (//input[contains(@formcontrolname,'numExterior')])[1]      ${nexterior}
    \   Texto   (//input[@formcontrolname='numInterior'])[1]     ${ninterior}
    \   Dormir   1.5
    \   Texto    (//input[@formcontrolname='codigoPostal'])[2]   ${cp2}    
    \   Tabulador   (//input[@autocomplete='NÑp'])[1]
    \   Dormir    1
    \   SLL     (//select[contains(@formcontrolname,'colonia')])[2]        ${colonia2}
    \   Texto   (//input[contains(@formcontrolname,'calle')])[2]      ${calle2}
    \   Texto   (//input[contains(@formcontrolname,'numExterior')])[2]      ${nexterior2}
    \   Texto   (//input[@formcontrolname='numInterior'])[2]     ${ninterior2}
    \   Tramite
    \   Scroll   0   0

    \   Dormir    6
    

    
  
   