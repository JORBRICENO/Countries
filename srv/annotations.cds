using {CatalogService} from './catalog-service';

annotate CatalogService.Countries with @odata.draft.enabled;
annotate CatalogService.Currencies with @odata.draft.enabled;
annotate CatalogService.Nationalities with @odata.draft.enabled;

annotate CatalogService.Countries with {
    Code     @title: 'Code';
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
        SelectionFields                : [
            Code,
            Alpha_2,
            Alpha_3
        ],
        HeaderInfo                     : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : 'Country',
            TypeNamePlural: 'Countries',
            Title         : {
                $Type: 'UI.DataField',
                Value: Country,
            },
        },
        LineItem                       : [
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
        FieldGroup #Country            : {
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
        FieldGroup #CurrencyInformation: {
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
        FieldGroup #NationalityInformation : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : Nationality.Nationality,
                },
            ],
        },
        Facets                         : [{
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
                    Target : '@UI.FieldGroup#NationalityInformation',
                    Label : 'Nationality Information',
                },                
            ],
            Label : 'General Information'
        }],
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
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Currency',
        TypeNamePlural : 'Currency',
        Title : {
            $Type : 'UI.DataField',
            Value : Currency
        },
        Description : {
            $Type : 'UI.DataField',
            Value : Num
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
    Nationality @title : 'Nationality';
    Code @title : 'Code';
};
