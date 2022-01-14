
select * from PortfolioProject..CovidDeaths
order by 3,4


Select Location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths 
--Shows liklihood of dying if you contract covid in Finland
Select Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location = 'Finland'
order by 1,2

--Looking at total cases vs population
--Shows what percentage of population got covid
Select Location,date,population,total_cases,(total_cases/population)*100 as InfectionRate
from PortfolioProject..CovidDeaths
where location = 'Finland'
order by 1,2

--Looking Countries with Highest infection Rate compared to Population
Select Location,MAX(total_cases)as HighestInfectionCount,MAX((total_cases/population))*100 as InfectionRate
from PortfolioProject..CovidDeaths
group by Location
order by InfectionRate desc



--Showing Countries with Highest death count per population
Select Location,MAX(cast(Total_deaths as int))as TotalDeathCount --Found out that total_deaths data type is varchar
from PortfolioProject..CovidDeaths
where continent is not null --so we exclude unwanted results 
group by Location
order by TotalDeathCount desc

--Showing continents with the highest death count per population

Select Location,MAX(cast(Total_deaths as int))as TotalDeathCount 
from PortfolioProject..CovidDeaths
where continent is  null  AND Location  not like '%income' 
group by Location
order by TotalDeathCount desc

--Showing income with the highest death count per population

Select Location,MAX(cast(Total_deaths as int))as TotalDeathCount 
from PortfolioProject..CovidDeaths
where continent is  null  AND Location   like '%income' 
group by Location
order by TotalDeathCount desc

--Global Numbers

Select sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths ,sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from PortfolioProject..CovidDeaths
where continent is not null 
--group by date
--order by 1,2

select * from PortfolioProject..CovidVaccinations

--Looking at Total Population vs Vaccinations
drop table if exists #PopulationVaccinated
Create table #PopulationVaccinated
(Continent nvarchar(255),Location nvarchar(255)
,Date datetime,population numeric ,New_Vaccinations numeric,RollingPeopleVaccinated numeric)

insert into #PopulationVaccinated 
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,sum(convert(BIGINT,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths as dea join PortfolioProject..CovidVaccinations as vac
on dea.location = vac.location and dea.date =vac.date
where dea.continent is not null


select *,(RollingPeopleVaccinated/population)*100 as percentofvaccinated from #PopulationVaccinated

--Create view to prepare for visualizations

create View PopulationPercentVaccinated as 
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,sum(convert(BIGINT,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths as dea join PortfolioProject..CovidVaccinations as vac
on dea.location = vac.location and dea.date =vac.date
where dea.continent is not null

select * from PopulationPercentVaccinated