# Gerekli paketler
library(dplyr)

# Örnek veri seti
set.seed(123)
n <- 1000
data <- data.frame(
  ID = 1:n,
  Age = round(rnorm(n, mean = 30, sd = 10)),
  Gender = sample(c("Male", "Female"), n, replace = TRUE),
  Height = round(rnorm(n, mean = 170, sd = 10)),
  Weight = round(rnorm(n, mean = 70, sd = 10)),
  Income = round(rnorm(n, mean = 50000, sd = 10000))
)

# Veri setini işleme
processed_data <- data %>%
  filter(Age >= 20 & Age <= 40) %>%  # Yaşı 20 ile 40 arasında olanları seçme
  select(ID, Age, Gender, Height, Weight, Income) %>%  # İlgili sütunları seçme
  mutate(BMI = Weight / ((Height / 100) ^ 2))  # BMI (Vücut Kitle İndeksi) hesaplama

# Veri setini görüntüleme
print("İşlenmiş veri seti:")
head(processed_data)

# Temel istatistikler
print("Temel istatistikler:")
summary(processed_data)

# Cinsiyete göre ortalama boyu gösteren bir kutu grafiği oluşturma
boxplot(Height ~ Gender, data = processed_data, main = "Cinsiyete Göre Boy Dağılımı", xlab = "Cinsiyet", ylab = "Boy")

