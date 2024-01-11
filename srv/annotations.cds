using {CatalogService} from './catalog-service';

annotate CatalogService.Countries with @odata.draft.enabled;
annotate CatalogService.Currencies with @odata.draft.enabled;
annotate CatalogService.Nationalities with @odata.draft.enabled;
annotate CatalogService.Companies with @odata.draft.enabled;
annotate CatalogService.CompanyAddresses with @odata.draft.enabled;

annotate CatalogService.Countries with {
    Code     @title: 'Code'
            @Common : { 
                ValueList : {
                    $Type : 'Common.ValueListType',
                    CollectionPath : 'Countries',
                    Parameters : [
                        {
                            $Type : 'Common.ValueListParameterInOut',
                            LocalDataProperty : Code,
                            ValueListProperty : 'Code',
                        },
                        {
                            $Type : 'Common.ValueListParameterDisplayOnly',
                            ValueListProperty : 'Alpha_2',
                        },
                        {
                            $Type : 'Common.ValueListParameterDisplayOnly',
                            ValueListProperty : 'Alpha_3',
                        },
                        {
                            $Type : 'Common.ValueListParameterDisplayOnly',
                            ValueListProperty : 'Country',
                        },
                    ],
                },
             };
    Alpha_2  @title: 'Alpha 2';
    Alpha_3  @title: 'Alpha 3';
    Country  @title: 'Country';
    Currency @title: 'Currency';
};

annotate CatalogService.Countries with @(
    Capabilities.SearchRestrictions: {
        $Type     : 'Capabilities.SearchRestrictionsType',
        Searchable: false
    },
    Common.SemanticKey             : [Code],
    UI                             : {
        SelectionFields                   : [
            Code,
            Alpha_2,
            Alpha_3
        ],
        HeaderInfo                        : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : 'Country',
            TypeNamePlural: 'Countries',
            Title         : {
                $Type: 'UI.DataField',
                Value: Country,
            },
        },
        LineItem                          : [
            {
                $Type: 'UI.DataField',
                Value: Code
            },
            {
                $Type: 'UI.DataField',
                Value: Alpha_2
            },
            {
                $Type: 'UI.DataField',
                Value: Alpha_3
            },
            {
                $Type: 'UI.DataField',
                Value: Country
            },
            {
                $Type: 'UI.DataField',
                Value: Currency.Currency
            }
        ],
        FieldGroup #Country               : {
            $Type: 'UI.FieldGroupType',
            Data : [
                {
                    $Type: 'UI.DataField',
                    Value: Code
                },
                {
                    $Type: 'UI.DataField',
                    Value: Alpha_2
                },
                {
                    $Type: 'UI.DataField',
                    Value: Alpha_3
                },
                {
                    $Type: 'UI.DataField',
                    Value: Country,
                    Label: 'Country'
                },
            ]
        },
        FieldGroup #CurrencyInformation   : {
            $Type: 'UI.FieldGroupType',
            Data : [
                {
                    $Type: 'UI.DataField',
                    Value: Currency.Num
                },
                {
                    $Type: 'UI.DataField',
                    Value: Currency.Currency
                }
            ],
        },
        FieldGroup #NationalityInformation: {
            $Type: 'UI.FieldGroupType',
            Data : [{
                $Type: 'UI.DataField',
                Value: Nationality.Nationality,
            }, ],
        },
        Facets                            : [
            {
                $Type : 'UI.CollectionFacet',
                Facets: [
                    {
                        $Type : 'UI.ReferenceFacet',
                        Target: '@UI.FieldGroup#Country',
                        Label : 'Country Information'
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        Target: '@UI.FieldGroup#CurrencyInformation',
                        Label : 'Currency Information',
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        Target: '@UI.FieldGroup#NationalityInformation',
                        Label : 'Nationality Information',
                    },
                ],
                Label : 'General Information'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: 'ToCompanies/@UI.LineItem',
            },
        ],
    }
);

annotate CatalogService.Currencies with {
    Num      @title: 'Num';
    Currency @title: 'Currency';
};

annotate CatalogService.Currencies with @(
    UI.SelectionFields: [
        Num,
        Currency
    ],
    UI.HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Currency',
        TypeNamePlural: 'Currency',
        Title         : {
            $Type: 'UI.DataField',
            Value: Currency
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Num
        }
    },
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: Num
        },
        {
            $Type: 'UI.DataField',
            Value: Currency
        }
    ],
    UI.FieldGroup     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Num,
            },
            {
                $Type: 'UI.DataField',
                Value: Currency,
            },

        ],
    },
    UI.Facets         : [{
        $Type : 'UI.CollectionFacet',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup',
            Label : 'Currency',
        }, ],
    }, ],
);

annotate CatalogService.Nationalities with {
    Nationality @title: 'Nationality';
    Code        @title: 'Code';
};

annotate CatalogService.Nationalities with @();

annotate CatalogService.Companies with {
    Company      @title: 'Company'
                 @Common : { 
                    ValueList : {
                        $Type : 'Common.ValueListType',
                        CollectionPath : 'Companies',
                        Parameters : [
                            {
                                $Type : 'Common.ValueListParameterInOut',
                                LocalDataProperty : Company,
                                ValueListProperty : 'Company',
                            },
                        ],
                    },
                  };
    Description  @title: 'Description'  @UI.MultiLineText;
};

annotate CatalogService.Companies with @(
    Capabilities.SearchRestrictions  : {
        $Type     : 'Capabilities.SearchRestrictionsType',
        Searchable: false
    },
    UI.HeaderInfo                    : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Company',
        TypeNamePlural: 'Companies',
        Title         : {
            $Type: 'UI.DataField',
            Value: Company,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description,
        },
    },
    UI.LineItem                      : [
        {
            $Type: 'UI.DataField',
            Value: Company,
        },
        {
            $Type: 'UI.DataField',
            Value: Description,
        },
    ],
    UI.FieldGroup #CompanyInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Company,
            },
            {
                $Type: 'UI.DataField',
                Value: Description,
            },
        ],
    },
    UI.Facets                        : [{
        $Type : 'UI.CollectionFacet',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#CompanyInformation',
                Label : 'Company Information',
            }, 
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'Address/@UI.FieldGroup#Address',
                Label : 'Address',
            },
        ],
        Label : 'General Information'
    }, 
    ],
);

annotate CatalogService.CompanyAddresses with {
    @readonly
    Country    @title : 'Country'
               @Common: {
        Text           : Country.Country,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Countries',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Country_ID,
                    ValueListProperty: 'Country',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Alpha_2',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Alpha_3',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Code',
                },
            ],
        },
    };
    Department @title : 'Department';
    Province   @title : 'Province';
    Region     @title : 'Region';
    Address    @title : 'Address'  @UI.MultiLineText;
    PostalCode @title : 'PostalCade';
};

annotate CatalogService.CompanyAddresses with @(
    UI.HeaderInfo         : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Address',
        TypeNamePlural: 'Addresses',
        Title         : {
            $Type: 'UI.DataField',
            Value: Country.Country,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Address,
        },
    },
    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: Country.Country,
        },
        {
            $Type: 'UI.DataField',
            Value: Department,
        },
        {
            $Type: 'UI.DataField',
            Value: Province,
        },
        {
            $Type: 'UI.DataField',
            Value: Region,
        },
        {
            $Type: 'UI.DataField',
            Value: Address,
        },
        {
            $Type: 'UI.DataField',
            Value: PostalCode,
        },
    ],
    UI.FieldGroup #Address: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Country.Country,
            },
            {
                $Type: 'UI.DataField',
                Value: Department,
            },
            {
                $Type: 'UI.DataField',
                Value: Province,
            },
            {
                $Type: 'UI.DataField',
                Value: Region,
            },
            {
                $Type: 'UI.DataField',
                Value: Address,
            },
            {
                $Type: 'UI.DataField',
                Value: PostalCode,
            },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.CollectionFacet',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Address',
            Label : 'Address',
        }, ],
        Label : 'General Information',
    }, ],
);


annotate CatalogService.CountriesxCompanies with {
    Country @title: 'Country';
    Company @title: 'Company';
};

annotate CatalogService.CountriesxCompanies with @(
    UI.HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Company',
        TypeNamePlural: 'Companies',
        Title         : {
            $Type: 'UI.DataField',
            Value: Company.Company,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Country.Country,
        },
    },
    UI.LineItem  : [
        {
            $Type: 'UI.DataField',
            Value: Company.Company,
        },
        {
            $Type: 'UI.DataField',
            Value: Company.Description,
        },
    ],
    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Company.Company,
            },
            {
                $Type: 'UI.DataField',
                Value: Company.Description,
            },
        ],
    },
    UI.Facets    : [{
        $Type : 'UI.CollectionFacet',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup',
            Label : 'Relationship',
        }, ],
    }, ],
);
