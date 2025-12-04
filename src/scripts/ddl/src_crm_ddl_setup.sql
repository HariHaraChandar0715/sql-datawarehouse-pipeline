/* 
             The below scripts are the DDL scripts to create database, schema and tables
             first it checks if the database is present or not if it is then it uses the
             database else it creates the database and uses it. 

             Then the following schemas like bronze, silver and gold are created within
             the database.

             After schema creation the tables for the source crm and erp are created within
             the bronze layer
*/



use master;
go



if exists (select name from sys.databases where name = N'dwdb')
    begin
        print'Database already exist';
        use dwdb;
    end
else
    begin
        print'Database does not exists';
        print'creating database : dwdb';
        create database dwdb;
        use dwdb;
        print'Database created';
    end


create schema bronze;
GO
create schema silver;
GO
create schema gold;
GO
 

if exists (select name from sys.tables where name = N'bronze.crm_product')
  print'>>> Table already exist...';
else
    begin
        create table bronze.crm_customer(
            customer_id bigint null,
            customer_key varchar(100) null,
            first_name varchar(75) null,
            last_name varchar(75) null,
            marital_status varchar(25) null,
            gender varchar(25) null,
            create_date date null
        );
    end
GO

if exists (select name from sys.tables where name = N'bronze.crm_product')
  print'>>>> Table already exists';
else
print'>>>> Table does not present';
print'Creating table : bronze.crm_product'
begin
    create table bronze.crm_product(
        product_id bigint null,
        product_key varchar(100) null,
        product_name varchar(100) null,
        product_cost decimal null,
        product_line varchar(75) null,
        start_date date null
    );
    print'>>>> Table created ';
end
GO

if exists (select name from sys.tables where name = N'bronze.crm_sales_details')
    print'>>>> Table already exists';
else
    print'>>>> Table does not present';
    print'>>>> Creating Table : bronze.xrm_sales_details';
    begin
        create table bronze.crm_sales_details(
            order_id nvarchar(50) null,
            product_key varchar(100) null,
            customer_id varchar(100) null,
            order_date nvarchar(50) null,
            ship_date nvarchar(50) null,
            due_date nvarchar(50) null,
            sales double precision null,
            quantity int null,
            price double precision null
        );
        print'Table Created';
    end
GO

if exists (select name from sys.tables where name = N'bronze.erp_cust_az12')
print'>>>> Table already exists';
else
    print'>>>> Table does not exists';
    print'>>>> Creating table : bronze.erp.cust_az12';
    begin
    create table bronze.erp_cust_az12(
        cid  nvarchar(50)null,
        bdate date null,
        gen nvarchar(50) null
    );
    print'Table created';
    end
GO

if exists (select name from sys.tables where name = N'bronze.erp_loc_a101')
    print'>>>> Table already exists';
else
    begin
        print'>>>> Table does not exists';
        print'>>>> Creating table : bronze.erp.loc_a101';
        create table bronze.erp_loc_a101(
            cid nvarchar(50) null,
            cntry nvarchar(50) null
        );
        print'Table created';
    end
GO

if exists (select name from sys.tables where name = N'bronze.erp_px_cat_g1v2')
    print'>>>> Table already exist';
else
    begin
        print'>>>> Table does not exist';
        print'>>>> Creating Table : bronze.erp_px_cat_g1v2';
        create table bronze.erp_px_cat_g1v2(
            id nvarchar(50) null,
            cat  nvarchar(50) null,
            subcat nvarchar(50) null,
            maintenance nvarchar(50) null
        );
        print'Table Created';
    end
GO





select * from bronze.crm_customer;