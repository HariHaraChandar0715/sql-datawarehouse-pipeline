use dwdb;
GO

create or alter procedure bronze.bronze_crp_bulk_load as   
begin
    
    truncate table bronze.erp_cust_az12;
    BULK INSERT bronze.erp_cust_az12
    FROM '/data/source_crm/source_erp/CUST_AZ12.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2
    );
    
    
    truncate table bronze.erp_loc_a101;
    BULK INSERT bronze.erp_loc_a101
    FROM '/data/source_crm/source_erp/LOC_A101.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2
    );
    

    truncate table bronze.erp_px_cat_g1v2;
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM '/data/source_crm/source_erp/PX_CAT_G1V2.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2
    );
end