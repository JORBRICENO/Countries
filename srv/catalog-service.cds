using {com.example as schema} from '../db/schema';

service CatalogService {
    entity Countries           as projection on schema.Countries;
    entity Currencies          as projection on schema.Currencies;
    entity Nationalities       as projection on schema.Nationalities;
    entity Companies           as projection on schema.Companies;
    entity CompanyAddresses      as projection on schema.CompanyAddresses;
    entity CountriesxCompanies as projection on schema.CountriesxCompanies;
}
