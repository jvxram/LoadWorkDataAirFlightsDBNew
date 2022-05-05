USE AirCraftsDBNew62
GO

-- � �������� �������� ���������� ����� �� �����
CREATE XML SCHEMA COLLECTION SchemaCollectionXsd AS '
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:ns="https://www.w3schools.com"
			xmlns:xml="http://www.w3.org/XML/1998/namespace"
			xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
			xmlns:sqltypes="https://schemas.microsoft.com/sqlserver/2004/sqltypes"
			xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes"
			xmlns:soap="https://schemas.microsoft.com/sqlserver/2004/SOAP"
			xmlns:ms="urn:schemas-microsoft-com:mapping-schema"
			xmlns:dt="urn:schemas-microsoft-com:datatypes"
			xmlns:sql="urn:schemas-microsoft-com:xml-sql">
	<!-- t (������ �� ��������� ����� "targetNamespace"), xsd, xsi, ns - �������� ������������ ���� (������� ���������� ������ �� URI) -->
	<xsd:annotation>
		<xsd:documentation>
			��� �����
		</xsd:documentation>
	</xsd:annotation>

	<xsd:element name="CustReg">
		<xsd:complexType>
			<xsd:sequence maxOccurs="unbounded">
				<!--fixme ����� �� ���������� ������ ������ ���� "step"-->
				<xsd:element name="step">
					<xsd:complexType>
						<xsd:sequence maxOccurs="unbounded">
							<xsd:element name="BeginDate" type="xsd:date" />
						</xsd:sequence>
						<xsd:attribute name="CraftRegFK" type="xsd:string" />
					</xsd:complexType>
				</xsd:element>
			</xsd:sequence>
		</xsd:complexType>
	</xsd:element>

	<xsd:element name="CustOwn">
		<xsd:complexType>
			<xsd:sequence maxOccurs="unbounded">
				<xsd:element name="step">
					<xsd:complexType>
						<xsd:sequence maxOccurs="unbounded">
							<xsd:element name="BeginDate" type="xsd:date" />
						</xsd:sequence>
						<xsd:attribute name="CraftOwnerFK" type="xsd:unsignedLong" />
					</xsd:complexType>
				</xsd:element>
			</xsd:sequence>
		</xsd:complexType>
	</xsd:element>

	<xsd:element name="CustOp">
		<xsd:complexType>
			<xsd:sequence maxOccurs="unbounded">
				<xsd:element name="step">
					<xsd:complexType>
						<xsd:sequence maxOccurs="unbounded">
							<xsd:element name="BeginDate" type="xsd:date" />
						</xsd:sequence>
						<xsd:attribute name="CraftOperatorFK" type="xsd:unsignedLong" />
					</xsd:complexType>
				</xsd:element>
			</xsd:sequence>
		</xsd:complexType>
	</xsd:element>
</xsd:schema>
'

PRINT '������� ��������� ���� XSD - dbo.SchemaCollectionXsd'
GO
