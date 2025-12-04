
use dwdb;
GO

create or alter procedure bronze.proc_bronze_crm_bulk_load as   

begin
    declare @start_time datetime2 = getdate();
    declare @end_time datetime2 = getdate();

    begin try
        print'Loading CRM Tables';

        set @start_time = getdate();

        print'>>>> Truncating table : bronze.crm_customer';
        
        truncate table bronze.crm_customer;

        print'>>>>. Inserting Data into : bronze.crm_customer';

        BULK INSERT bronze.crm_customer
        FROM '/data/source_crm/source_crm/bronze.crm_customer.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2
        );

        set @end_time = getdate();

        print'bronze.crm.customer Load Duration :' + cast(datediff(second, @start_time, @end_time) as nvarchar);
        print'------------------------------------------------------';

        set @start_time = getdate();
        
        print'>>>> Truncating Table :  bronze.crm_product';

        truncate table bronze.crm_product;

        print'>>>> Inserting Data into : bronze.crm_product';

        BULK INSERT bronze.crm_product
        FROM '/data/source_crm/source_crm/prd_info.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2
        );

        set @end_time = getdate();

        print'bronze.crm.product Load Duration :' + cast(datediff(second, @start_time, @end_time) as nvarchar);
        print'------------------------------------------------------';

        set @start_time = getdate();
        
        print'>>>> Truncating Table : bronze.crm_sales_details';

        truncate table bronze.crm_sales_details;

        print'>>>> Inserting Data into : bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details

        FROM '/data/source_crm/source_crm/sales_details.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2
        );

        set @end_time = getdate();

        print'bronze.crm_sales_details Load Duration :' + cast(datediff(second, @start_time, @end_time) as nvarchar);
        print'------------------------------------------------------';

    end try

    begin catch

        print'=====================================================';
        print'Error Occured during bronze layer load';
        print'Error Message :' + error_message();
        print'Error Number :' + cast(error_number() as nvarchar);
        print'Error State :' + cast(error_state() as nvarchar);
        print'=====================================================';

    end catch
end

-- Run as sysadmin
GRANT ADMINISTER BULK OPERATIONS TO SA;



