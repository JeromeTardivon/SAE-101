

Salle[] initSalles(String file){
  
  String[] tab=loadStrings(file);
  Salle[] res=new Salle[tab.length-1];
  for(int i=1;i<tab.length;i++){ //<>//
    
    String[] t=splitTokens(tab[i],";");
    res[i-1]=new Salle();
    res[i-1].nom= t[0];
    res[i-1].type= t[2];
    res[i-1].nbPlaces= int(t[1]);
    
  }
  return res;
  
}

SousGroupe[] initSousGroupes(String file){
  String[] tab=loadStrings(file);
  SousGroupe[] res=new SousGroupe[tab.length-1];
  for(int i=1;i<tab.length;i++){
    String[]t=splitTokens(tab[i],";");
    res[i-1]=new SousGroupe();
    res[i-1].nomGroupe=t[1];
    res[i-1].nomSsGroupe=t[0];
    res[i-1].nbEtu=int(t[2]);
    res[i-1].nbRU=round(res[i-1].nbEtu*float(t[3])/100);
  }
  return res;
}

  String[] initProfs(String file){
  String[] tab=loadStrings(file);
  String[]res=new String[tab.length-1];
  for(int i=1;i<tab.length;i++){
    res[i-1]=tab[i];
  }
  return res;
}

void initData(){
  
  Salle[] lstSalles=initSalles("salles.csv");
  SousGroupe[] lstSousGroupes=initSousGroupes("etudiants.csv");
  String[] lstProfs=initProfs("enseignants.csv");
  for(int i=0;i<lstSalles.length;i++){
    println(lstSalles[i].nom, lstSalles[i].nbPlaces,lstSalles[i].type);
  }
  println();
  for(int i=0;i<lstSousGroupes.length;i++){
    println(lstSousGroupes[i].nomGroupe, lstSousGroupes[i].nomSsGroupe,lstSousGroupes[i].nbEtu,lstSousGroupes[i].nbRU);
  }
  println();
  for(int i=0;i<lstProfs.length;i++){
    println(lstProfs[i]);
  }
  

  
  
}
void setup(){
  initData();
}
