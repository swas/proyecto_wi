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
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Action">Acci�n</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Adventure">Aventuras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Animation">Animaci�n</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Sci-Fi">Ciencia Ficci�n</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Comedy">Comedia</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Crime">Crimenes</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Documentary">Documental</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Drama">Drama</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Fantasy">Fantas�a</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=War">Guerra</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Children">Infantil</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=IMAX">IMAX</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Mystery">Misterio</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo2&categoria=Romance">Rom�nticas</a></li>
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
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Espa�ol">Pop-Rock Espa�ol</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Pop-Rock Internacional">Pop-Rock Internacional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Clasico">Cl�sico</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Dance">Dance</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Rap/Hip-Hop">Rap/Hip-Hop</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Chill Out">Chill Out</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Bandas Sonoras">Bandas Sonoras</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Jazz-Blues">Jazz-Blues</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Flamenco y Cancion">Flamenco y Cancion Espa�ola</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Musicas del Mundo">M�sicas del Mundo</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Regional">Regional</a></li>
                <li><a href="/ProyectoWI/classes/ControladorArticulo?accion=Catalogo&categoria=Infantil">Infantil</a></li>

        </ul>
        </div>
        </div>
</html>
