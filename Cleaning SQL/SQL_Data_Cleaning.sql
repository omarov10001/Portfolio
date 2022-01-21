-- Cleaning Data in SQL Queries

select * from PortfolioProject..NashvilleHousing

-- Standardize Date Format

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;
Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)


-- Populate Property Address data

select a.ParcelID , a.PropertyAddress , b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
from NashvilleHousing a join NashvilleHousing b 
on a.ParcelID = b.ParcelID and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

update a 
set a.PropertyAddress=ISNULL(a.PropertyAddress,b.PropertyAddress)
from NashvilleHousing a join NashvilleHousing b
on a.ParcelID=b.ParcelID and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

-- Breaking out Address into Individual Columns (Address, City, State)

select PropertyAddress
from NashvilleHousing

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From PortfolioProject.dbo.NashvilleHousing

alter table NashvilleHousing
add PropertySplitAddress nvarchar(255)

update NashvilleHousing 
set PropertySplitAddress=SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )
 
alter table NashvilleHousing
add PropertySplitCity nvarchar(255)

update NashvilleHousing 
set PropertySplitCity=SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

Select *
From PortfolioProject.dbo.NashvilleHousing

select parsename(replace(owneraddress,',','.'),3), parsename(replace(owneraddress,',','.'),2)
, parsename(replace(owneraddress,',','.'),1) 
from NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)



ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

select * from NashvilleHousing


-- Change Y and N to Yes and No in "Sold as Vacant" field
select distinct(soldasvacant) , COUNT(soldasvacant) from NashvilleHousing
group by soldasvacant
order by 2

select soldasvacant , case when soldasvacant = 'Y' then 'Yes' when soldasvacant = 'N' then 'No' else soldasvacant END
from NashvilleHousing

update NashvilleHousing 
set soldasvacant=case when soldasvacant = 'Y' then 'Yes' when soldasvacant = 'N' then 'No' else soldasvacant END


-- Delete Unused Columns

Select *
From PortfolioProject.dbo.NashvilleHousing

alter table NashvilleHousing 
drop column OwnerAddress, TaxDistrict, PropertyAddress, SaleDate




