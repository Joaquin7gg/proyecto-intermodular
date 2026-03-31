<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <title>Informe de inventario - <xsl:value-of select="inventario/@club"/></title>
        <link rel="icon" type="image/png" href="../img/favicon.png"/>
        <link rel="stylesheet" href="../css/styles.css"/>
      </head>
      <body id="inicio">
        <div class="contenedor contenedor-informe">

          <header class="cabecera-seccion cabecera-informe">
            <h1>Informe de inventario tecnológico</h1>
            <p><strong>Entidad:</strong> <xsl:value-of select="inventario/@club"/></p>
            <p><strong>Fecha de generación:</strong> <xsl:value-of select="inventario/@fecha"/></p>
          </header>

          <nav class="menu-principal menu-informe">
            <a href="#resumen">Resumen</a>
            <a href="#inventario-completo">Inventario completo</a>
            <a href="#operativo">Operativos</a>
            <a href="#mantenimiento">Mantenimiento</a>
            <a href="#averiado">Averiados</a>
            <a href="#retirado">Retirados</a>
          </nav>

          <section id="resumen" class="rejilla tarjetas">
            <article class="tarjeta tarjeta-resumen">
              <h3>Total de tipos</h3>
              <p><xsl:value-of select="count(inventario/tipos/tipo)"/></p>
            </article>

            <article class="tarjeta tarjeta-resumen">
              <h3>Total de ubicaciones</h3>
              <p><xsl:value-of select="count(inventario/ubicaciones/ubicacion)"/></p>
            </article>

            <article class="tarjeta tarjeta-resumen">
              <h3>Total de proveedores</h3>
              <p><xsl:value-of select="count(inventario/proveedores/proveedor)"/></p>
            </article>

            <article class="tarjeta tarjeta-resumen">
              <h3>Total de elementos</h3>
              <p><xsl:value-of select="count(inventario/items/item)"/></p>
            </article>
          </section>

          <section class="bloque-informe" id="inventario-completo">
            <h2>Inventario completo</h2>
            <div class="tabla-scroll">
              <table class="tabla-datos tabla-informe">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Modelo</th>
                    <th>Cantidad</th>
                    <th>Función</th>
                    <th>Ubicación</th>
                    <th>Proveedor</th>
                    <th>Estado</th>
                    <th>Coste por unidad</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="inventario/items/item">
                    <xsl:sort select="@estado"/>
                    <xsl:sort select="@id"/>
                    <tr>
                      <td><xsl:value-of select="@id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="/inventario/tipos/tipo[@id = current()/@tipoRef]"/></td>
                      <td><xsl:value-of select="modelo"/></td>
                      <td><xsl:value-of select="cantidad"/></td>
                      <td><xsl:value-of select="funcion"/></td>
                      <td><xsl:value-of select="/inventario/ubicaciones/ubicacion[@id = current()/@ubicacionRef]"/></td>
                      <td><xsl:value-of select="/inventario/proveedores/proveedor[@id = current()/@proveedorRef]"/></td>
                      <td><xsl:value-of select="@estado"/></td>
                      <td>
                        <xsl:value-of select="costeUnidad"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="costeUnidad/@moneda"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </section>

          <section class="bloque-informe estado-operativo" id="operativo">
            <h2>Equipos operativos</h2>
            <div class="tabla-scroll">
              <table class="tabla-datos tabla-informe">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Modelo</th>
                    <th>Ubicación</th>
                    <th>Cantidad</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="inventario/items/item[@estado='operativo']">
                    <tr>
                      <td><xsl:value-of select="@id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="/inventario/tipos/tipo[@id = current()/@tipoRef]"/></td>
                      <td><xsl:value-of select="modelo"/></td>
                      <td><xsl:value-of select="/inventario/ubicaciones/ubicacion[@id = current()/@ubicacionRef]"/></td>
                      <td><xsl:value-of select="cantidad"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </section>

          <section class="bloque-informe estado-mantenimiento" id="mantenimiento">
            <h2>Equipos en mantenimiento</h2>
            <div class="tabla-scroll">
              <table class="tabla-datos tabla-informe">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Modelo</th>
                    <th>Ubicación</th>
                    <th>Cantidad</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="inventario/items/item[@estado='mantenimiento']">
                    <tr>
                      <td><xsl:value-of select="@id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="/inventario/tipos/tipo[@id = current()/@tipoRef]"/></td>
                      <td><xsl:value-of select="modelo"/></td>
                      <td><xsl:value-of select="/inventario/ubicaciones/ubicacion[@id = current()/@ubicacionRef]"/></td>
                      <td><xsl:value-of select="cantidad"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </section>

          <section class="bloque-informe estado-averiado" id="averiado">
            <h2>Equipos averiados</h2>
            <div class="tabla-scroll">
              <table class="tabla-datos tabla-informe">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Modelo</th>
                    <th>Ubicación</th>
                    <th>Cantidad</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="inventario/items/item[@estado='averiado']">
                    <tr>
                      <td><xsl:value-of select="@id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="/inventario/tipos/tipo[@id = current()/@tipoRef]"/></td>
                      <td><xsl:value-of select="modelo"/></td>
                      <td><xsl:value-of select="/inventario/ubicaciones/ubicacion[@id = current()/@ubicacionRef]"/></td>
                      <td><xsl:value-of select="cantidad"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </section>

          <section class="bloque-informe estado-retirado" id="retirado">
            <h2>Equipos retirados</h2>
            <div class="tabla-scroll">
              <table class="tabla-datos tabla-informe">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Modelo</th>
                    <th>Ubicación</th>
                    <th>Cantidad</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="inventario/items/item[@estado='retirado']">
                    <tr>
                      <td><xsl:value-of select="@id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="/inventario/tipos/tipo[@id = current()/@tipoRef]"/></td>
                      <td><xsl:value-of select="modelo"/></td>
                      <td><xsl:value-of select="/inventario/ubicaciones/ubicacion[@id = current()/@ubicacionRef]"/></td>
                      <td><xsl:value-of select="cantidad"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </section>

          <p class="volver-inicio">
            <a href="#inicio">Volver arriba</a>
          </p>

        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>