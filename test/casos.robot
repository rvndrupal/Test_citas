***Settings***
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     BuiltIn


***Variables****
${curp}
${rfc}
${pdf1}     C:\\pdf\\pdf1.pdf
${pdf2}     C:\\pdf\\pdf2.pdf
${categoria}        Demo dos
${siglas}           Demd
${Organizacion}     Demo Organización
${nombre}    Rodrigo
${Apellido}     Villanueva
${Nieto}        Nieto
${reg}      4




***Keywords***  

Login
    Esperar Iniciar Forzar    10
    [Arguments]     ${arg1}     ${arg2}
     #Video Iniciar 
    Esperar Iniciar ok    5
    Dormir Todos  ${tiempo}
    Abrir navegador  ${arg1}   ${arg2}  
    Maximizar 
    Click   //*[@id="details-button"]
    Click   //*[@id="proceed-link"]
    Texto  //input[contains(@id,'j_username')]      rodrigo
    Texto   //input[contains(@id,'j_password')]     villanueva
    Click  (//button[contains(.,'Enviar')])[1]
    Dormir    3
    Scroll  0  250
    Texto  //input[contains(@id,'j_username')]      olivia.rodriguez
    Texto   //input[contains(@id,'j_password')]     senades2020
    Resultado  .5  ${dir}/Login_password.png   Se introducen los datos para el Login
    Click  (//button[contains(.,'Enviar')])[1]
    Scroll  0  500
    Dormir  1
    Scroll  0   150
    Resultado  .5  ${dir}/Calendario.png   Se muestra el calendario


Calendario
    Esperar Iniciar Forzar    10
    Esperar Iniciar ok    5
    Texto  //input[contains(@id,'buscarfecha:anio')]  2018
    Dormir  1
    Texto  //input[contains(@id,'buscarfecha:anio')]  2020
    SLI     //select[@id='buscarfecha:idMes']   4
    Resultado  .5  ${dir}/Buscar_2020.png   Buscar
    Dormir  .5
    Click  //a[@href='#'][contains(.,'Buscar')]
    Scroll   0   600
    Resultado  .5  ${dir}/Calendario_resultado.png   Calendario Resultados
    Click  //a[@href='#'][contains(.,'Semana')]
    Scroll   0   600
    Resultado  .5  ${dir}/Calendario_semana.png   Calendario por Semana
    Scroll  0  100





Catalagos Categorías
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Categorías')]
    Click  //a[@href='#'][contains(.,'Agregar categoría')]
    Scroll  0  250
    Texto  //input[@id='busquedaAltaForm:idDependencia']  ${categoria}
    Texto  //input[contains(@id,'busquedaAltaForm:idSiglas')]  ${siglas}
    Click  //a[@href='#'][contains(.,'Guardar')]
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Categorías')]
    Texto  //input[contains(@id,'busquedaForm:idBusqueda')]  Demo 
    Click  //a[@href='#'][contains(.,'Buscar')]
    Scroll  0  450

Catalagos Categorías Excel   
    #Datos de Excel
    ${rows}=   Leer numero de filas  Hoja1
    : FOR  ${i}  IN RANGE     1  ${rows}+1    
    \   Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    \   Scroll  0  150
    \   Click  //a[@href='#'][contains(.,'Categorías')]
    \   Click  //a[@href='#'][contains(.,'Agregar categoría')]
    \   Scroll  0  250
    \   ${categoria}=   Leer celda  Hoja1  ${i}      13
    \   ${siglas}=   Leer celda  Hoja1  ${i}    14
    \   Texto  //input[@id='busquedaAltaForm:idDependencia']  ${categoria}
    \   Texto  //input[contains(@id,'busquedaAltaForm:idSiglas')]  ${siglas}
    \   Dormir  2
    \   Log    ${i}
    \   Click  //a[@href='#'][contains(.,'Guardar')]    
    \   Run Keyword If  '${i}'=='${reg}'     Exit For Loop
   
    
    # Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    # Scroll  0  150
    # Click  //a[@href='#'][contains(.,'Categorías')]
    # Texto  //input[contains(@id,'busquedaForm:idBusqueda')]   ${categoria}
    # Click  //a[@href='#'][contains(.,'Buscar')]   
    # Scroll  0  450
    # Dormir      3

Catalogos Organizaciones
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Organizaciones')]
    Scroll  0  250
    Click  //a[@href='#'][contains(.,'Agregar organización')]
    Scroll  0  250
    SLL     //select[contains(@name,'busquedaAltaForm:idDependencia')]   ${categoria}
    Texto  //input[contains(@id,'busquedaAltaForm:idOrganizacion')]  ${Organizacion}
    Texto  //input[@id='busquedaAltaForm:idSiglas']  Org
    Click  //a[@href='#'][contains(.,'Guardar')]
    Dormir  1
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Organizaciones')]
    Scroll  0  300
    SLL     //select[@name='busquedaForm:idDependenciaS']   ${categoria}
    Click  //a[@href='#'][contains(.,'Buscar')]
    Scroll  0  400
    Resultado  .5  ${dir}/Organización.png   Se muestra la Organización


#Organizaciones Excel
Catalogos Organizaciones Excel
    ${rows}=   Leer numero de filas  Hoja1
    : FOR  ${i}  IN RANGE     1  ${rows}+1
    \   Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    \   Scroll  0  150
    \   Click  //a[@href='#'][contains(.,'Organizaciones')]
    \   Scroll  0  250
    \   Click  //a[@href='#'][contains(.,'Agregar organización')]
    \   Scroll  0  250
    \   ${categoria_org}=   Leer celda  Hoja1  ${i}  13
    \   ${nombre_organizacion}=   Leer celda  Hoja1  ${i}  15
    \   ${siglas_organizacion}=   Leer celda  Hoja1  ${i}  16
    \   SLL     //select[contains(@name,'busquedaAltaForm:idDependencia')]   ${categoria_org}
    \   Texto  //input[contains(@id,'busquedaAltaForm:idOrganizacion')]  ${nombre_organizacion}
    \   Texto  //input[@id='busquedaAltaForm:idSiglas']  ${siglas_organizacion}
    \   Dormir  2
    \   Click  //a[@href='#'][contains(.,'Guardar')]
    \   Dormir  1
    \   Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    \   Scroll  0  150
    \   Click  //a[@href='#'][contains(.,'Organizaciones')]
    \   Scroll  0  300
    \   SLL     //select[@name='busquedaForm:idDependenciaS']   ${categoria_org}
    \   Click  //a[@href='#'][contains(.,'Buscar')]
    \   Scroll  0  400
    \   Resultado  .5  ${dir}/Organización.png   Se muestra la Organización
    \   Run Keyword If  '${i}'=='${reg}'     Exit For Loop


Catalogos Representantes
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Representantes')]
    Click  //a[contains(@id,'idt59:botonAgregar')][@href='#'][contains(.,'Agregar Representantes')]
    Scroll  0  250
    SLL     //select[contains(@name,'formAltaRepresentante:idDependenciaAlta')]     ${categoria}
    Click   //*[@id="formAltaRepresentante:idOrganizacionAlta"]/option[2]
    Texto  //input[contains(@id,'formAltaRepresentante:nombreRepresentante')]  ${nombre}
    Texto  //input[contains(@id,'formAltaRepresentante:apellidoPRepresentante')]  ${Apellido}
    Texto  //input[contains(@id,'formAltaRepresentante:apellidoMRepresentante')]  ${Nieto}
    Click    //a[contains(@id,'formAltaRepresentante:idEditar')]
    Texto  //input[@id='formAltaRepresentante:idCargo']  ${cargo}
    Click  //a[contains(@id,'formAltaRepresentante:idBotonAceptar')]
    Scroll  0  600
    Click  //a[contains(@id,'formAltaRepresentante:botonGuardar')]
    Dormir  1
    Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    Scroll  0  150
    Click  //a[@href='#'][contains(.,'Representantes')]
    Texto  //input[contains(@id,'busquedaForm:idBusqueda')]  Rodrigo 
    Scroll  0  300
    Dormir  1
    Click  //a[@href='#'][contains(.,'Buscar')]
    Scroll  0  600
    Dormir  1
    Resultado  .5  ${dir}/Representante.png   Se muestra el Representante


#Catalogo representantes Excel
Catalogos Representantes Excel
    ${rows}=   Leer numero de filas  Hoja1
    : FOR  ${i}  IN RANGE     1  ${rows}+1
    \   Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    \   Scroll  0  150
    \   Click  //a[@href='#'][contains(.,'Representantes')]
    \   Click  //a[contains(@id,'idt59:botonAgregar')][@href='#'][contains(.,'Agregar Representantes')]
    \   Scroll  0  250
    \   ${categoria_rep}=   Leer celda  Hoja1  ${i}  13
    \   ${organizacion_rep}=   Leer celda  Hoja1  ${i}  15
    \   ${nom_rep}=   Leer celda  Hoja1  ${i}  18
    \   ${pri_rep}=   Leer celda  Hoja1  ${i}  19
    \   ${seg_rep}=   Leer celda  Hoja1  ${i}  20
    \   ${cargo}=   Leer celda  Hoja1  ${i}  17
    \   SLL     //select[contains(@name,'formAltaRepresentante:idDependenciaAlta')]     ${categoria_rep}
    \   Dormir   1
    \   SLL     (//select[contains(@class,'form-control')])[2]   ${organizacion_rep}
    \   Dormir      1
    \   Texto  //input[contains(@id,'formAltaRepresentante:nombreRepresentante')]   ${nom_rep}
    \   Texto  //input[contains(@id,'formAltaRepresentante:apellidoPRepresentante')]    ${pri_rep}
    \   Texto  //input[contains(@id,'formAltaRepresentante:apellidoMRepresentante')]    ${seg_rep}    
    \   Click    //a[contains(@id,'formAltaRepresentante:idEditar')]
    \   Dormir  1
    \   Texto  //input[@id='formAltaRepresentante:idCargo']  ${cargo}
    \   Dormir      1
    \   Click  //a[contains(@id,'formAltaRepresentante:idBotonAceptar')]
    \   Scroll  0  600    
    \   Click  //a[contains(@id,'formAltaRepresentante:botonGuardar')]
    \   Dormir  1
    \   Click  //a[contains(@id,'j_idt9:linkCatalogos')]
    \   Scroll  0  150
    \   Click  //a[@href='#'][contains(.,'Representantes')]
    \   Texto  //input[contains(@id,'busquedaForm:idBusqueda')]  ${nom_rep} 
    \   Scroll  0  300
    \   Dormir  1
    \   Click  //a[@href='#'][contains(.,'Buscar')]
    \   Scroll  0  600
    \   Dormir  1
    \   Resultado  .5  ${dir}/Representante.png   Se muestra el Representante
    \   Run Keyword If  '${i}'=='${reg}'     Exit For Loop



Agregar
    Click  //a[contains(@id,'idt9:linkAgregar')][@href='#'][contains(.,'Agregar')]
    Scroll  0  200
    SLL  //select[@id='busquedaAltaForm:idSlcTipoEvento']  Actividad
    SLL  //select[contains(@id,'busquedaAltaForm:idSlcEstatus')]  En Proceso
    Texto  //input[@id='busquedaAltaForm:idInputTitulo']  Demo del primer Evento
    Click   //input[@id='busquedaAltaForm:idInputFecha']
    Click    (//a[@href='#'])[24] 
    #Evento Lunes
    Click   (//input[contains(@type,'text')])[4]
    Click  //div[@class='Hunter-hour-name'][contains(.,'12')]
    Click  //li[@class='Hunter-minute'][contains(.,'30')]
    Resultado  .5  ${dir}/Evento.png   Datos del evento.
    Scroll  0  400
    Texto   //div[contains(@id,'textBox')]  Carga de la Información del primer evento de prueba.
    Obtener Text  //div[contains(@id,'textBox')]
    Scroll  0  800
    Dormir  1
    Click  (//button[contains(@type,'button')])[3]
    SLL  //select[contains(@id,'busquedaAltaForm:idDependencia')]   ${categoria}
    Click  //*[@id="busquedaAltaForm:idOrganizacion"]/option[2]    
    Click  (//a[@href='#'][contains(.,'Agregar')])[2]
    Scroll  0  1600
    Dormir  1.5
    Click  //a[@href='#'][contains(.,'Guardar')]
    Dormir  1
    Click  //a[@href='#'][contains(.,'Siguiente')]
    #Segunda Sección
    Click  //*[@id="representantesAltaForm:idSlcRepresentante"]/option[2]
    Click  (//a[@href='#'][contains(.,'Agregar')])[2]
    Scroll  0  500
    Resultado  .5  ${dir}/Participante_agregado.png   Datos del evento.
    Click  //a[@href='#'][contains(.,'Guardar')]
    Dormir  1
    Scroll  0  600
    Click  //a[@href='#'][contains(.,'Siguiente')]
    #tercera sección
    Scroll  0  300
    Click  //a[@href='#'][contains(.,'Nuevo acuerdo')]
    Dormir  1.5
    Texto  //textarea[contains(@id,'agregaAcuerdoForm:idAcuerdo')]  Demo del primer Acuerdo de prueba
    Dormir  1
    Click  //a[@id='agregaAcuerdoForm:idBotonAceptar']
    Scroll  0  500
    Dormir  1.5
    Click  //input[contains(@id,'idt58')][@type='checkbox']
    Dormir  1.5
    #Click  //*[@id="idAcuerdosForm:table-elementos:0:idSlcEstatus"]/option[2]
    #SLI  //select[@id='idAcuerdosForm:table-elementos:0:idSlcEstatus']  2
    Click  //*[@id="idAcuerdosForm:table-elementos:0:idSlcEstatus"]/option[2]
    Dormir  1
    #carga de los archivos
    #Ruta  C:\\Test_ssjae\\test\\Archivos\\Febrero1.pdf
    Click  //a[@href='#'][contains(.,'Adjuntar documento')]
    Dormir  1.5
    Examinar   //input[@id='cargaArchivoForm:file']     C:\\Test_ssjae\\test\\Archivos\\Febrero1.pdf
    Dormir  1
    Click  //a[@href='#'][contains(.,'Cargar')]
    Scroll  0  900
    Dormir  1
    Click  //a[@href='#'][contains(.,'Adjuntar documento')]
    Dormir  1.5
    Examinar   //input[@id='cargaArchivoForm:file']     C:\\Test_ssjae\\test\\Archivos\\Febrero2.pdf
    Dormir  1.5
    Resultado  .5  ${dir}/Carga_pdf.png   Se muestra la Organización
    Click  //a[@href='#'][contains(.,'Cargar')]
    Scroll  0  900
    Dormir  2
    Resultado  .5  ${dir}/Mostrar_pdf_pdf.png   Se muestra la Organización
    Click  //a[@href='#'][contains(.,'Guardar')]
    Dormir  1
    Resultado  .5  ${dir}/Termina_carga.png   Se muestra la Organización
    Dormir  3

 


Mostrar evento
    Click  (//a[@href='#'])[1]
    Scroll  0  650
    Dormir  2
    Click   (//span[@class='fc-title'][contains(.,'Demo del primer Evento')])[25]
    Scroll  0  400
    Resultado  .5  ${dir}/Resultado_uno.png    Se muestra Resultado uno
    Dormir  2
    Scroll  0  700
    Resultado  .5  ${dir}/Resultado_dos.png    Se muestra Resultado dos
    Dormir  2
    Scroll  0  900
    Resultado  .5  ${dir}/Resultado_tres.png    Se muestra Resultado tres
    Dormir  2
    Scroll  0  1400
    Resultado  .5  ${dir}/Resultado_cuatro.png    Se muestra Resultado cuatro
    Dormir  2
    Scroll  0  17000
    Resultado  .5  ${dir}/Resultado_cinco.png    Se muestra Resultado cinco
    Dormir  2
    Click  (//a[@href='#'])[15]
    Dormir  8



Agregar Excel
    ${rows}=   Leer numero de filas  Hoja1
    : FOR  ${i}  IN RANGE     1  ${rows}+1
    \   Click  //a[contains(@id,'idt9:linkAgregar')][@href='#'][contains(.,'Agregar')]
    \   Scroll  0  200   
    \   ${tipo}=   Leer celda  Hoja1  ${i}  1
    \   ${estatus}=   Leer celda  Hoja1  ${i}  2
    \   ${nombre_evento}=   Leer celda  Hoja1  ${i}  3
    \   ${fecha}=   Leer celda  Hoja1  ${i}  4
    \   ${hora}=   Leer celda  Hoja1  ${i}  5
    \   ${minuto}=   Leer celda  Hoja1  ${i}  6
    \   ${informacion}=   Leer celda  Hoja1  ${i}  7
    \   ${categoria}=   Leer celda  Hoja1  ${i}  13
    \   ${organizacion}=   Leer celda  Hoja1  ${i}  15
    \   ${nom_rep}=   Leer celda  Hoja1  ${i}  18
    \   ${pri_rep}=   Leer celda  Hoja1  ${i}  19
    \   ${seg_rep}=   Leer celda  Hoja1  ${i}  20
    \   ${cargo}=   Leer celda  Hoja1  ${i}  17
    \   ${repres}=    Leer celda  Hoja1  ${i}  21
    \   ${acuerdo}=   Leer celda  Hoja1  ${i}  11
    \   ${estatus}=   Leer celda  Hoja1  ${i}  12
    \   SLL  //select[@id='busquedaAltaForm:idSlcTipoEvento']  ${tipo}
    \   SLL  //select[contains(@id,'busquedaAltaForm:idSlcEstatus')]  ${estatus}
    \   Texto  //input[@id='busquedaAltaForm:idInputTitulo']  ${nombre_evento}   
    \   Click   //input[@id='busquedaAltaForm:idInputFecha']
    \   Click    (//a[@href='#'])[${fecha}]    
    \   Click   (//input[contains(@type,'text')])[4]
    \   Click  //div[@class='Hunter-hour-name'][contains(.,'${hora}')]
    \   Click  //li[@class='Hunter-minute'][contains(.,'${minuto}')]
    \   Resultado  .5  ${dir}/Evento_excel.png   Datos del evento por excel.
    \   Scroll  0  400
    \   Texto   //div[contains(@id,'textBox')]  ${informacion}.
    \   Scroll  0  800   
    \   SLL  //select[contains(@id,'busquedaAltaForm:idDependencia')]   ${categoria}
    \   Dormir  2
    \   Scroll  0   900
    \   SLL     //select[contains(@id,'busquedaAltaForm:idOrganizacion')]       ${organizacion}
    \   Click  (//a[@href='#'][contains(.,'Agregar')])[2]
    \   Scroll  0  1600
    \   Dormir  1.5
    \   Click  //a[@href='#'][contains(.,'Guardar')]
    \   Dormir  1
    \   Click  //a[@href='#'][contains(.,'Siguiente')]
    # #Segunda Sección
    \   Dormir   2
    \   Scroll    0     300
    \   SLL     //select[contains(@id,'representantesAltaForm:idSlcRepresentante')]     ${repres}
    \   Dormir      1.5
    \   Click  (//a[@href='#'][contains(.,'Agregar')])[2]
    \   Scroll  0  500
    \   Resultado  .5  ${dir}/Participante_agregado.png   Datos del evento.
    \   Click  //a[@href='#'][contains(.,'Guardar')]
    \   Dormir      1.5
    \   Scroll  0  800
    \   Click  //a[@href='#'][contains(.,'Siguiente')]
    # #tercera sección
    \   Scroll  0  300
    \   Click  //a[@href='#'][contains(.,'Nuevo acuerdo')]
    \   Dormir  1.5
    \   Texto  //textarea[contains(@id,'agregaAcuerdoForm:idAcuerdo')]      ${acuerdo}
    \   Dormir  1
    \   Click  //a[@id='agregaAcuerdoForm:idBotonAceptar']
    \   Scroll  0  500
    \   Dormir  1.5
    \   Click  //input[contains(@id,'idt58')][@type='checkbox']
    \   Dormir  2
    \   SLL     //select[contains(@id,'idAcuerdosForm:table-elementos:0:idSlcEstatus')]    ${estatus}
    \   Dormir   2   
    # #carga de los archivos
    # #Ruta  C:\\Test_ssjae\\test\\Archivos\\Febrero1.pdf
    \   Click  //a[@href='#'][contains(.,'Adjuntar documento')]
    \   Dormir  1.5
    \   Examinar   //input[@id='cargaArchivoForm:file']     C:\\Test_ssjae\\test\\Archivos\\Febrero1.pdf
    \   Dormir  1
    \   Click  //a[@href='#'][contains(.,'Cargar')]
    \   Scroll  0  900
    \   Dormir  1
    \   Click  //a[@href='#'][contains(.,'Adjuntar documento')]
    \   Dormir  1
    \   Examinar   //input[@id='cargaArchivoForm:file']     C:\\Test_ssjae\\test\\Archivos\\Febrero2.pdf
    \   Dormir  1
    \   Resultado  .5  ${dir}/Carga_pdf.png   Se muestra la Organización
    \   Click  //a[@href='#'][contains(.,'Cargar')]
    \   Scroll  0  900
    \   Dormir  1
    \   Resultado  .5  ${dir}/Mostrar_pdf_pdf.png   Se muestra la Organización
    \   Click  //a[@href='#'][contains(.,'Guardar')]
    \   Dormir  1
    \   Resultado  .5  ${dir}/Termina_carga.png   Se muestra la Organización
    \   Dormir  1.5
    \   Run Keyword If  '${i}'=='${reg}'     Exit For Loop
    


Prueba if 
    ${TYPE}=    Set Variable    V1
    Run Keyword If    '${TYPE}' == 'V1'    Log     Testing Variant 1
    Run Keyword If    '${TYPE}' == 'V2'    Log    Testing Variant 2
    Run Keyword If    '${TYPE}' == 'V3'    Log    Testing Variant 3




Citas paso_uno
    Esperar Iniciar Forzar    10
    [Arguments]     ${arg1}     ${arg2}
    Esperar Iniciar ok    5
    Dormir Todos  ${tiempo}
    Abrir navegador  ${arg1}   ${arg2}  
    Maximizar

Happy path
    ${rows}=   Leer numero de filas  Hoja1
    : FOR  ${i}  IN RANGE     1  ${rows}+1  
    \   ${combo}=   Leer celda  Hoja1  ${i}  1
    \   ${calendario}=   Leer celda  Hoja1  ${i}  2
    \   ${horario}=   Leer celda  Hoja1  ${i}  3
    \   ${fiscal}=   Leer celda  Hoja1  ${i}  4
    \   ${curp}=   Leer celda  Hoja1  ${i}  5
    \   ${rfc}=   Leer celda  Hoja1  ${i}  6
    \   ${nom}=   Leer celda  Hoja1  ${i}  7
    \   ${ap}=   Leer celda  Hoja1  ${i}  8
    \   ${am}=   Leer celda  Hoja1  ${i}  9
    \   ${lada}=   Leer celda  Hoja1  ${i}  10
    \   ${telefono}=   Leer celda  Hoja1  ${i}  11
    \   ${gmail}=   Leer celda  Hoja1  ${i}  12
    \   ${contenido}=   Leer celda  Hoja1  ${i}  13
    \   Scroll  0  400
    \   Click  //div[@class='placeholder'][contains(.,'Selecciona una opción...')]
    \   Dormir  4
    \   Click    /html/body/app-root/app-inicio/main/div/form/div[2]/div/div/ng-select/select-dropdown/div/div[2]/ul/li[${combo}]/span  #cambiar el 5 final
    \   Dormir  2
    \   Click  //button[@class='btn btn-primary'][contains(.,'Siguiente')]
    \   Scroll  0  700
    \   Dormir  4
    \   Click  //span[contains(.,'${calendario}')]     #Calendario
    \   Dormir  4
    \   SLI  //select[contains(@id,'seccion')]      3  #el indice modal hora
    \   Dormir  2
    \   Click  //button[@class='btn btn-primary'][contains(.,'Aceptar')]
    \   Click  //button[@class='btn btn-primary'][contains(.,'Siguiente')]
    \   Dormir  1
    \   Scroll  0  700
    \   SLI  //select[contains(@class,'form-control ng-untouched ng-pristine ng-invalid')]  1      #FISICA O MODAL
    # # curp PECJ770709HDFRHN09
    # #rfc PECJ770709TL9
    \   Texto   //input[contains(@id,'curp')]       ${curp}
    \   Texto  //input[contains(@formcontrolname,'rfc')]    ${rfc}
    \   Texto  //input[contains(@id,'nombre')]      ${nom}
    \   Texto  //input[contains(@id,'primerApellido')]      ${ap}
    \   Texto   //input[contains(@id,'segundoApellido')]    ${am}
    \   Scroll  0  900
    \   Texto  //input[contains(@id,'claveLada')]  ${lada}
    \   Texto  //input[contains(@id,'telefono')]   ${telefono}
    \   Texto   //input[contains(@id,'correoElectronico')]  ${gmail}
    \   Texto  //input[contains(@id,'observaciones')]  ${contenido}
    \   Dormir  2
    #\   Click  //button[@class='btn btn-primary'][contains(.,'Siguiente')]
    \   Go To   http://10.16.3.36:8005/inicio












      

    





    


    




    






  
    
    

