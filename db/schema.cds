namespace com.example;

using {cuid} from '@sap/cds/common';


entity Countries : cuid {
        Code     : String(3);
        Alpha_2  : String(2);
        Alpha_3  : String(3);
        Country  : String(100);
        Currency : Association to Currencies
                       on Currency.Country = $self;
};

entity Currencies : cuid {
        Num      : String(3);
        Currency : String;
        Country  : Association to Countries;
};
