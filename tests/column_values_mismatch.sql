with source_data as (
    select
    listing_id,
    listing_name,
    room_type,
    case
        when minimum_nights = 0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
from {{ ref('src_listings') }}
),
target_data as (
    select * from {{ ref('dim_listings_cleansed') }}
)

select * from source_data
except distinct
select * from target_data