namespace com.example;

using {cuid} from '@sap/cds/common';

entity Countries : cuid {
    Code        : String(3);
    Alpha_2     : String(2);
    Alpha_3     : String(3);
    Country     : String(100);
    Currency    : Association to Currencies
                      on Currency.Country = $self;
    Nationality : Association to Nationalities
                      on Nationality.Country = $self;
    ToCompanies : Composition of many CountriesxCompanies
                      on ToCompanies.Country = $self;
};

entity Currencies : cuid {
    Num      : String(3);
    Currency : String(80);
    Code     : String(2);
    Country  : Association to Countries;
};

entity Nationalities : cuid {
    Code        : String(3);
    Nationality : String(80);
    Country     : Association to Countries;
};

@cds.autoexpose
entity CountriesxCompanies : cuid {
    Country : Association to Countries;
    Company : Association to Companies;
};

@cds.autoexpose
entity Companies : cuid {
    Company     : String(80);
    Description : String(400);
    Address     : Association to CompanyAddresses
                      on Address.Company = $self;
    ToCountries : Association to many CountriesxCompanies
                      on ToCountries.Company = $self;
};

entity CompanyAddresses : cuid {
    Country    : Association to Countries;
    Department : String(80);
    Province   : String(80);
    Region     : String(80);
    Address    : String(200);
    PostalCode : String(5);
    Company    : Association to Companies;
};
