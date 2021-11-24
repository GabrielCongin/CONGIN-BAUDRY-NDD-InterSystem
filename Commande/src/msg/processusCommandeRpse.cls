Class msg.processusCommandeRpse Extends (msg.basic.reponse, %JSON.Adaptor)
{

Property codeRetour As %String;

Property libErreur As %String;

Storage Default
{
<Data name="getCatalogueRpseDefaultData">
<Subscript>"getCatalogueRpse"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>getCatalogueRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
