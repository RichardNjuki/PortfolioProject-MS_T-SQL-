
--Queries Used for Tableau Visualization

--1. Total_Deaths/ Total_Cases as Death_Percentage

Select SUM(new_cases) as Total_Cases, SUM(Cast(new_deaths as INT)) AS Total_Deaths, SUM(Cast(new_deaths as INT))/SUM(new_cases)*100 As Death_Percentage 
from [dbo].[CovidDeaths$]
Where continent is not null
Order By 1,2

--2. Total_Death_Count/Location Not In World, European Union And International

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From [dbo].[CovidDeaths$]
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

--3. PercentageOfPopulationInfected Per Location And Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [dbo].[CovidDeaths$]
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc

--4 PercentageOfPopulationInfected Per Location, Population And Date

Select Location, Population, date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [dbo].[CovidDeaths$]
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc