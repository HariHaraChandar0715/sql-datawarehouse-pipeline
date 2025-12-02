create database dwdb;
GO
use dwdb;
GO
create schema bronze;
GO
create schema silver;
GO
create schema gold;
GO

create table bronze.crm_customer(
    customer_id bigint NULL,
    customer_key varchar(100) NULL,
    first_name varchar(75) NULL,
    last_name varchar(75) NULL,
    marital_status varchar(25) NULL,
    gender varchar(25) NULL,
    create_date date NULL
);
GO
create table bronze.crm_product(
    product_id bigint null,
    product_key varchar(100) null,
    product_name varchar(100) null,
    product_cost decimal null,
    product_line varchar(75) null,
    start_date date null,
    end_date date null
);
GO
drop table bronze.crm_sales_details;
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
GO

create table bronze.erp_cust_az12(
    cid  nvarchar(50)null,
    bdate date null,
    gen nvarchar(50) null
);
GO
create table bronze.erp_loc_a101(
    cid nvarchar(50) null,
    cntry nvarchar(50) null
);
GO
create table bronze.erp_px_cat_g1v2(
    id nvarchar(50) null,
    cat  nvarchar(50) null,
    subcat nvarchar(50) null,
    maintenance nvarchar(50) null
);
GO

select * from bronze.crm_customer;