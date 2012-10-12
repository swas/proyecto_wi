</html>



        <c:set var="tit" value="${requestScope['tituloBUS']}" />
        <c:set var="aut" value="${requestScope['autorBUS']}" />
        <c:set var="anh" value="${requestScope['anhoBUS']}" />
        <c:set var="prec" value="${requestScope['precioBUS']}"/>
	   <center>
             <form action="/ProyectoWI/classes/ControladorArticulo" >


               <input type="text" name="tituloBUS" id="url"  value="${tit}" onfocus="if(this.value=='Titulo')this.value=''" />

            <input type="text" name="autorBUS" id="url"  value="${aut}" onfocus="if(this.value=='Autor')this.value=''" />


            <select name="precioBUS">
                <option value="${prec}">${prec}</option>
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="40">40</option>
		<option value="50">50</option>
		<option value="60">60</option>
		<option value="70">70</option>
		<option value="80">80</option>
		<option value="90">90</option>
		
	      </select>

                &euro;

                <select name="anhoBUS">
                <option value="${anh}">${anh}</option>
                <option value="2011">2011</option>
                <option value="2010">2010</option>
                <option value="2009">2009</option>
                <option value="2008">2008</option>
                <option value="2007">2007</option>
                <option value="2006">2006</option>
                <option value="2005">2005</option>
                <option value="2004">2004</option>
                <option value="2003">2003</option>
                <option value="2002">2002</option>
                <option value="2001">2001</option>
                <option value="2000">2000</option>
                <option value="1999">1999</option>
                <option value="1998">1998</option>
                <option value="1997">1997</option>
                <option value="1996">1996</option>
                <option value="1995">1995</option>
                <option value="1994">1994</option>
                <option value="1993">1993</option>
                <option value="1992">1992</option>
                <option value="1991">1991</option>
                <option value="1990">1990</option>

        </select>


            <input type="hidden" name="accion" value="busquedaAvanzada" size = "15" class = "formularioAlta">
            &nbsp;&nbsp;
            <input type="submit" value="Buscar">

            </form>
      </center>
	  


        </html>