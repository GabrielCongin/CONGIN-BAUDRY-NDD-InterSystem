/// 
Class BP.ProcessusCommande Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.processusCommandeDmde' response='msg.processusCommandeRpse' height='2000' width='2000' >
<context>
<property name='cat' type='webObjet.wsCatalogue' instantiate='0' />
<property name='voit' type='webObjet.wsVoiture' instantiate='0' />
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1000' >
<call name='VoitureCatalogue' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.cat" value="callresponse.voiture" action="set" />
</response>
</call>
<if name='VoitureExist' condition='response.codeRetour = "OK"' xpos='200' ypos='350' xend='200' yend='900' >
<true>
<call name='DemanderPlaque' target='BO.Plaque' async='0' xpos='335' ypos='500' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.plaque" value="callresponse.plaque" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
</response>
</call>
<transform name='Trans' class='Transform.TransformCatalogToCommand' source='context.cat' target='context.voit' xpos='335' ypos='600' />
<call name='EnregistrerVoiture' target='Voiture' async='0' xpos='335' ypos='700' >
<request type='msg.creerVoitureDmde' >
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.marque" value="request.marque" action="set" />
<assign property="callrequest.voiture.modele" value="request.modele" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
<assign property="callrequest.voiture.categorie" value="context.voit.categorie" action="set" />
<assign property="callrequest.voiture.nbPlaces" value="context.voit.nbPlaces" action="set" />
</request>
<response type='msg.creerVoitureRpse' >
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
</response>
</call>
<call name='DeposerVoiture' target='FileActivity' async='0' xpos='335' ypos='800' >
<request type='msg.pushVoitureFileDmde' >
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.marque" value="request.marque" action="set" />
<assign property="callrequest.voiture.modele" value="request.modele" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
<assign property="callrequest.voiture.categorie" value="context.voit.categorie" action="set" />
<assign property="callrequest.voiture.nbPlaces" value="context.voit.nbPlaces" action="set" />
</request>
<response type='msg.pushVoitureFileRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
