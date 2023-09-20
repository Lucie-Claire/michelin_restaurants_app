# Michelin Restaurant App Finder
![r](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)

Find the best Michelin-starred restaurants near you, with the power of R!

![App Screenshot]()

## Overview

The Michelin Restaurant App Finder is an R-based application that allows users to search and discover Michelin-starred restaurants in various cities and regions from Spain. Whether you're a culinary enthusiast or just looking for an exceptional dining experience, our app is the perfect guide.

## Features

- *Filters*: Filter search results by the number of Michelin stars
- *Interactive Maps*: View exact address and cuisine type by clicking on each restaurant.
- *Colorful visualization*: Identify restaurants by price ranges according to the legend.

## Future work

- *Search & Discover*: Easily search restaurants by name, city, or cuisine type.
- *Ratings & Reviews*: Read reviews from fellow food enthusiasts and see restaurant ratings.

## Installation

### Prerequisites

Ensure you have R and the necessary packages installed.

1. Install R: [Download R](https://cran.r-project.org/)
2. Recommended: Install RStudio: [Download RStudio](https://rstudio.com/products/rstudio/download/)

### Setup

1. Clone this repository:

bash
git clone https://github.com/your-username/michelin-restaurant-finder.git


2. Navigate to the directory:

bash
cd michelin-restaurant-finder


3. Open the project in RStudio or your preferred R environment.

4. Install the required R packages:

To utilize the functions from the specified libraries in R, you need to install the corresponding packages. Here's how you can install each of them:

1. `shiny`: A package to build interactive web apps straight from R.
   ```R
   install.packages("shiny")
   ```

2. `leaflet`: A package to create interactive web maps with the JavaScript 'Leaflet' library.
   ```R
   install.packages("leaflet")
   ```

3. `dplyr`: A part of the `tidyverse`, it provides a set of tools for efficiently manipulating datasets.
   ```R
   install.packages("dplyr")
   ```

4. `tidyr`: Also a part of the `tidyverse`, it's used for tidying data.
   ```R
   install.packages("tidyr")
   ```

5. `RColorBrewer`: Provides color schemes for maps and other graphics designed by Cynthia Brewer.
   ```R
   install.packages("RColorBrewer")
   ```

You can also combine all of these into a single command to install them all at once:
```R
install.packages(c("shiny", "leaflet", "dplyr", "tidyr", "RColorBrewer"))
```

Remember that you only need to install these packages once, but you'll need to load them using the `library()` function every time you start a new R session and want to use functions from these packages.


5. Run the app:

R
source("path-to-app-script.R")


## Data Source

The restaurant data used in this app is sourced from [Michelin Guide](https://guide.michelin.com/) and saved as the CSV file named `michelin_my_maps.csv`. All rights and credits belong to Michelin Guide and their respective contributors.

## Future work

- Search & Discover: Easily search restaurants by name, city, or cuisine type.
- Ratings & Reviews: Read reviews from fellow food enthusiasts and see restaurant ratings.

## Contributing

Contributions are welcome! Please read our [Contributing Guide](./CONTRIBUTING.md) for more information.

## License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.

## Acknowledgements

- Thanks to the R community for their robust packages and continuous support.
- Shout out to all food enthusiasts who provided feedback for this project.
