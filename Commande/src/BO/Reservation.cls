/// Description
Class BO.Reservation Extends Ens.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method SampleCall(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    do ##class(Ens.Util.JSON).ObjectToJSONStream(request,ou .EntityBody)
    Return $$$ERROR($$$NotImplemented)
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="Ens.Request">
        <Method>SampleCall</Method>
    </MapItem>
</MapItems>
}

}
