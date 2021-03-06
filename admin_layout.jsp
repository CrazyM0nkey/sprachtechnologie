<%@page import="javax.xml.ws.ResponseWrapper"%>
<%@page import="java.util.LinkedList" %>

<%@page import="java.util.List" %>

<%@page import="start.ConnectionDB" %>

<!DOCTYPE html>
<html>
<head>
	<title>sozialraumApp</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style type="text/css">
	.spacer{ min-height: 50px; }
</style>


	<nav class="navbar navbar-default " id="scrollMenu">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="index.jsp">Sozialraum</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Sozialraum</a></li>
					<li><a href="#">Angebote</a></li>
					<li><a href="#">Logout</a></li>
					<li><a href="impressum.html">Impressum</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- Eintrag anlegen -->
	<div class="row">
		<div class="container text-center">
			<div class="col-xs-12">
				<h2>
					Eintrag erstellen
				</h2>
			</div>
			<div class="spacer"></div>
			<form ACTION="traeger_hinzufuegen.jsp" METHOD="post" name="traeger">
				<div class="form-group col-xs-12">
					<div class="col-xs-12 col-sm-3">
						<label for="traeger">Veranstalter/Träger:</label>
						<input type="text" class="form-control" name="traeger">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="straße">Straße:</label>
						<input type="text" class="form-control" name="strasse">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="hausnummer">Hausnummer:</label>
						<input type="text" class="form-control" name="hausnummer">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="plz">Postleitzahl:</label>
						<input type="text" class="form-control" name="plz">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="tel">Telefonnummer:</label>
						<input type="text" class="form-control" name="tel">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="fax">Faxnummer:</label>
						<input type="text" class="form-control" name="fax">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="mail">E-Mail:</label>
						<input type="text" class="form-control" name="mail">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="website">Webseite:</label>
						<input type="text" class="form-control" name="website">
					</div>
					<div class="col-xs-12">
						<label for="ansprechpartner">Ansprechpartner:</label>
						<input type="text" class="form-control" idname"ansprechpartner">
					</div>
				
					<div class="spacer col-xs-12"></div>
					<div class="col-xs-12">
						<label for="beschreibung">Angebotsbeschreibung inkl. Sprache und Zielgruppe (max 700 Zeichen):</label>
						<textarea class="form-control" maxlength="700" rows="5" name="beschreibung"></textarea>
					</div>
					<div class="spacer col-xs-12"></div>
					
					<div class="col-xs-12">
						<form ACTION="" METHOD="post">
							<div class="col-xs-6">
								<span class="col-xs-12"> Einfügen in:</span>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<select class="form-control" id="sel1" name="unterkat_options">
										<%
										ConnectionDB con = new ConnectionDB();
										List<String> unterkategorien = new LinkedList<String>();
										unterkategorien = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
										for(String uk : unterkategorien)
										{
										%>
										<option><%= uk %></option>
										<%} %>
									</select>
								</div>
							</div>
						</form>
					</div>
					
					<div class="spacer col-xs-12"></div>
					<div class="col-xs-12 text-center">
						<div class="col-sm-4 hidden-xs"></div>
						<button class="btn btn-success col-xs-12 col-sm-4 ">Eintragen</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr>
	
<!-- Kategorieverwaltung -->


	<div class="row">
		<div class="container text-center">
			<h2>Kategorieverwaltung</h2>
			<div class="spacer"></div>
			<h3 class="col-xs-12"> Kategorie einfügen</h1>
			
			<div class="col-xs-12">
				<form ACTION="oberkategorie_hinzufuegen.jsp" METHOD="post">	
					<div class="col-xs-12 col-sm-4">
						<label>Name der neuen Kategorie:</label>
						<input type="text" class="form-control" id="uk" name="oberkat">
					</div>
					<div class="col-xs-12 col-sm-4">
							<label>Unterkategorie wählen: </label>
							<div class="form-group">
							  <select class="form-control" id="sel1" name="oberkat_options">
							  <%
								List<String> oberkategorie = new LinkedList<String>();
								oberkategorie = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
								for(String ok : oberkategorie)
								{
							  %>
							     <option><%= ok %></option>
							   <%} %>
							  </select>
							</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<label style="color:#fff;">Hinzufügen</label>
						<button class="btn btn-success col-xs-12"> Hinzufügen</button>
					</div>
				</form>
			</div>

			<div class="col-xs-12">
				<div class="spacer"></div>
				<h3 class="col-xs-12"> Kategorie löschen</h1>
				<form ACTION="oberkategorie_delete.jsp" METHOD="post">
					<div class="col-xs-6">
						<div class="form-group">
						  <select class="form-control" id="sel1" name="oberkat_options">
						  <%
							List<String> oberkategorie_delete = new LinkedList<String>();
						  	oberkategorie_delete = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
							for(String ok : oberkategorie_delete)
							{
						  %>
						     <option><%= ok %></option>
						   <%} %>
						  </select>
						</div>
					</div>
					<div class="col-xs-6">
						<button class="btn btn-danger col-xs-12"> Löschen</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>

	<!-- Eintrag löschen -->
	<div class="row text-center">
		<div class="container">
			<div class="col-xs-12">
				<h2>
					Eintrag löschen
				</h2>
				<div class="spacer"></div>
			</div>
			<!-- auswählen der Kategorie-->
			<div class="spacer"></div>
			<form METHOD="post" name="traeger_form_anzeigen">
				<div class="col-xs-12 col-sm-6">
					<div class="col-xs-12">
						<div class="form-group">
							<label for="options">
								Aus folgender Kategorie:
							</label>
							<select class="form-control" id="sel1" name="options_kat_traeger">
								<%
									
									List<String> oberkategorien = new LinkedList<String>();
									oberkategorien = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
									for(String ok : oberkategorien)
									{
								%>
								<option><%= ok %></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div class="col-sm-12">
						<label ">Direkte Suche nach Träger</label><br>
						<input type="text" class="form-control col-xs-12" name="search_traeger" placeholder="Träger eingeben ...">
					</div>
				</div>
				<div  class="col-xs-12" style="height: 25px;"></div>
				<div class="col-sm-12">
					<button class="btn btn-success col-xs-12" name="traeger_but_anzeigen"> Anzeigen</button>
				</div>
				<div class="col-xs-12"  style="height: 75px;"></div>		
				<label class="col-xs-12 text-center" for="sel2">Wähle die zu löschenden Einträge aus</label>
				
				<div class="col-xs-12"  style="height: 75px;"></div>
						
<%
if(request.getParameter("traeger_but_anzeigen") != null)
{
	String textFieldSearchCheck = request.getParameter("search_traeger");
	String searchKategorieTraeger = "";
	LinkedList<String> geholteDatenTraeger = null;
	if(textFieldSearchCheck.equals(""))
	{
		searchKategorieTraeger = request.getParameter("options_kat_traeger");
		geholteDatenTraeger = new LinkedList<String>(con.getTraegerData("SELECT * FROM sozialraum_db.traeger WHERE id IN(SELECT traeger_id FROM sozialraum_db.traeger_kat_mapping WHERE traeger_kat_id =(SELECT id FROM sozialraum_db.kategorie WHERE name = '"+searchKategorieTraeger+"'));"));
	}
	else
	{
		searchKategorieTraeger = textFieldSearchCheck;
		geholteDatenTraeger = new LinkedList<String>(con.getTraegerData("SELECT * FROM sozialraum_db.traeger WHERE MATCH (angebot) AGAINST ('"+textFieldSearchCheck+"' IN NATURAL LANGUAGE MODE);"));

	}
						
						for(int index = 0; index <= geholteDatenTraeger.size()-9; index += 10){
							String traegername = geholteDatenTraeger.get(index);
							String plz = geholteDatenTraeger.get(index+1);
							String strasse = geholteDatenTraeger.get(index+2);
							String nummer = geholteDatenTraeger.get(index+3);
							String telefon = geholteDatenTraeger.get(index+4);
							String fax = geholteDatenTraeger.get(index+5);
							String ansprechpartner = geholteDatenTraeger.get(index+6);
							String mailadresse = geholteDatenTraeger.get(index+7);
							String website= geholteDatenTraeger.get(index+8);
							String angebot= geholteDatenTraeger.get(index+9);
						//schleife um die Einträge aus der Datenbank zu holen 
						%>
						<div class="checkbox col-xs-12">
							<input type="checkbox" name="traegerCheckboxen" value=<%=traegername %>>
							<div class="row well text-left">	
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-8">
										<h4>Träger:</h4>
										<span><%= traegername%></span>
									</div>
									<div class="col-xs-12 col-sm-4">
										<h4>Wo:</h4>
										<span><%= strasse%></span>
										<span><%= nummer %></span>
										<span><%= plz%></span>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-8">
										<h4>Beschreibung: </h4>
										<span><%= angebot%></span>
									</div>
									<div class="col-xs-12 col-sm-4">
										<h4>Ansprechpartner:</h4>
										<span><%= ansprechpartner%></span>
										<span><%= telefon%></span>
										<span><%= fax%></span>
										<span><%= mailadresse%></span><br />
										<span><%= website%></span>
									</div>
								</div>
							</div>
						</div>
						<%
							}}
						%>
		
			
			<!-- auswählen des zu löschenden Beitrags -->
			<div class="col-xs-12">
				
					<div class="form-group">
						<div class="spacer"></div>
						
						

					<div class="spacer"></div>
					<div class=" col-sm-4"></div>
					<div class="col-sm-4">
					<%
					String[] gecheckteCheckboxen = request.getParameterValues("traegerCheckboxen");
					List<String> auswahlCheckbox = new LinkedList<String>();
					if(gecheckteCheckboxen != null)
					{
						for(int index = 0; index < gecheckteCheckboxen.length; ++index)
						{
							auswahlCheckbox.add(gecheckteCheckboxen[index]);
						}
					}
					con.deleteTraeger(auswahlCheckbox);

					%>
						<button class="btn btn-danger col-xs-12"> Einträge löschen</button>
					</div>
					<div class="col-xs-12" style="height: 75px;" ></div>
				</form>
			</div>
		</div>

</body>
</html>
