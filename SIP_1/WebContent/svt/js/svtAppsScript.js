
//sirve para traducir el nombre de la aplicación en la url, 
//a partir del nombre de la aplicación original en la base de datos. 
function getWebAppNameUrl(appName){
	if (appName == "SVT")
		return "svt";
	if (appName == "SVTP")
		return "svtp";
	if (appName == "SVA")
		return "svt-aud";
	if (appName == "SPA")
		return "svtp-aud";
	if (appName == "SIUVT")
		return "siuvt";
	if (appName == "SIUCO")
		return "siuvt-aud";
	
}