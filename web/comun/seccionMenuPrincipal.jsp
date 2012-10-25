<%-- 
    Document   : seccionMenuPrincipal
    Created on : 24-oct-2012, 1:00:20
    Author     : Pablo
--%>

<html>
        <div id="menuv">
        <div id="menuTitle">    
        <ul>
            <li><a onmousedown="document.getElementById('musica').style.display='none';document.getElementById('pelicula').style.display='block'">Peliculas</a></li>
        </ul>
        </div>    
        <div id="pelicula">                            
        <ul>                
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Action">Acción</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Adventure">Aventuras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Animation">Animación</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Sci-Fi">Ciencia Ficción</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Comedy">Comedia</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Crime">Crimenes</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Documentary">Documental</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Drama">Drama</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Fantasy">Fantasía</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=War">Guerra</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Children">Infantil</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=IMAX">IMAX</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Mystery">Misterio</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Romance">Románticas</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Horror">Terror</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Thriller">Thriller</a></li>
                
        </ul>
        </div>
        <div id="menuTitle"> 
        <ul>
            <li><a onmousedown="document.getElementById('pelicula').style.display='none';document.getElementById('musica').style.display='block'">Musica</a></li>
        </ul>
        </div>    
        <div id="musica">                            
        <ul>                
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Español">Pop-Rock Español</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Internacional">Pop-Rock Internacional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Clasico">Clásico</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Dance">Dance</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Rap/Hip-Hop">Rap/Hip-Hop</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Chill Out">Chill Out</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Bandas Sonoras">Bandas Sonoras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Jazz-Blues">Jazz-Blues</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Flamenco y Cancion">Flamenco y Cancion Española</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Musicas del Mundo">Músicas del Mundo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Regional">Regional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Infantil">Infantil</a></li>

        </ul>
        </div>
        </div>
</html>
