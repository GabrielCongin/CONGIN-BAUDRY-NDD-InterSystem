Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    set voiture.nom = pRequest.nom
    set voiture.categorie = pRequest.categorie
    set voiture.plaque = pRequest.plaque
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method reserverVoiture(pRequest As msg.reserverVoitureDmde, Output pResponse As msg.reserverVoitureRpse) As %Status
{
    if (##class(data.Reservation).getByCategory(pRequest.categorie, .idVoiture)){
        set pResponse = ##class(msg.reserverVoitureRpse).%New()
        set reservation = ##class(data.Reservation).%New()
        set reservation.categorie = pRequest.categorie
        set reservation.dateDebut = pRequest.dateDebut
        set reservation.dateFin = pRequest.dateFin
        set reservation.plaque = idVoiture
        set tsc = reserverVoiture.%Save()
        set pResponse.codeRetour = "OK"
    }else {
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "Catégorie non reférencée"
    }
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
    <MapItem MessageType="msg.reserverVoitureDmde">
        <Method>reserverVoiture</Method>
    </MapItem>
</MapItems>
}

}
