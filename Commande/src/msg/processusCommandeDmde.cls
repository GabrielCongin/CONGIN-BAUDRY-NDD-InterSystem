Class msg.processusCommandeDmde Extends Ens.Request
{

Property marque As %String;

Property modele As %String;

Property couleur As %String;

Storage Default
{
<Data name="processusCommandeDmdeDefaultData">
<Subscript>"processusCommandeDmde"</Subscript>
<Value name="1">
<Value>marque</Value>
</Value>
<Value name="2">
<Value>modele</Value>
</Value>
<Value name="3">
<Value>couleur</Value>
</Value>
</Data>
<DefaultData>processusCommandeDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
