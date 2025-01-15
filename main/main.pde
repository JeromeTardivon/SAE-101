Event[] initEvent(String path) {
  String[] lines = loadStrings(path);
  Event[] event = new Event[lines.length];
  String[] tmp;
  String[] DescTmp = new String[1];
  Event toPush = new Event();

  for (int i = 0; i<lines.length; i++) {
    tmp = lines[i].split(":");
    try {
      if (tmp[0].equals("BEGIN") && tmp[1].equals("VEVENT")) {
        toPush = new Event();
      } else if (tmp[0].equals("END") && tmp[1].equals("VEVENT")) {
        event[i] = toPush;
      } else if (tmp[0].equals("DTSTART")) {
        toPush.timeStart = tmp[1];
      } else if (tmp[0].equals("DTEND")) {
        toPush.timeEnd = tmp[1];
      } else if (tmp[0].equals("SUMMARY")) {
        toPush.summary = tmp[1];
      } else if (tmp[0].equals("LOCATION")) {
        toPush.location = tmp[1].split("\\\\,");
      } else if (tmp[0].equals("DESCRIPTION")) {
        DescTmp[0] = "";
        while (!lines[i + 1].split(":")[0].equals("UID")) {
          DescTmp[0] += lines[i].substring(1);
          i++;
        }
        DescTmp[0] += lines[i].substring(1);
        DescTmp = DescTmp[0].split("\\\\n\\\\n")[1].split("\\\\n");
        toPush.groupe = new String[DescTmp.length];
        toPush.teacher = new String[DescTmp.length];
        boolean isProf = false;
        for (int l = 0; l<DescTmp.length; l++) {
          isProf = false;
          for (int k = 0; k<LSTPROFS.length; k++) {
            if (LSTPROFS[k].equals(DescTmp[l])) {
              toPush.teacher[l] = DescTmp[l];
              isProf = true;
              break;
            }
          }
          if (!isProf) {
            toPush.groupe[l] = DescTmp[l];
          }
        }
      }
    }
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }
  return event;
}

Salle[] initSalles(String file) {

  String[] tab=loadStrings(file);
  Salle[] res=new Salle[tab.length-1];
  for (int i=1; i<tab.length; i++) { //<>//

    String[] t=splitTokens(tab[i], ";");
    res[i-1]=new Salle();
    res[i-1].nom= t[0];
    res[i-1].type= t[2];
    res[i-1].nbPlaces= int(t[1]);
  }
  return res;
}

SousGroupe[] initSousGroupes(String file) {
  String[] tab=loadStrings(file);
  SousGroupe[] res=new SousGroupe[tab.length-1];
  for (int i=1; i<tab.length; i++) {
    String[]t=splitTokens(tab[i], ";");
    res[i-1]=new SousGroupe();
    res[i-1].nomGroupe=t[1];
    res[i-1].nomSsGroupe=t[0];
    res[i-1].nbEtu=int(t[2]);
    res[i-1].nbRU=round(res[i-1].nbEtu*float(t[3])/100);
  }
  return res;
}

String[] initProfs(String file) {
  String[] tab=loadStrings(file);
  String[]res=new String[tab.length-1];
  for (int i=1; i<tab.length; i++) {
    res[i-1]=tab[i];
  }
  return res;
}

void initData() {

  
  for (int i=0; i<lstSalles.length; i++) {
    println(lstSalles[i].nom, lstSalles[i].nbPlaces, lstSalles[i].type);
  }
  println();
  for (int i=0; i<lstSousGroupes.length; i++) {
    println(lstSousGroupes[i].nomGroupe, lstSousGroupes[i].nomSsGroupe, lstSousGroupes[i].nbEtu, lstSousGroupes[i].nbRU);
  }
  println();
  for (int i=0; i<lstProfs.length; i++) {
    println(lstProfs[i]);
  }

  Salle[] LSTSALLES=initSalles("salles.csv");
  SousGroupe[] LSTSOUSGROUPES=initSousGroupes("etudiants.csv");
  String[] LSTPROFS=initProfs("enseignants.csv");

void setup(){
  
}
