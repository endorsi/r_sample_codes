library(ggplot2)



### Kendi Veri Setimi Üreterek Keşifsel Analiz

# Müşteri ID Oluşturma
musteri_id <- 1:100

# Ürün ID Oluşturma
urun_id <- sample(1:100, 100, replace = TRUE)

# Ürün Adı Oluşturma
urun_adi <- sample(c("Ürün A", "Ürün B", "Ürün C", "Ürün D", "Ürün E"), 100, replace = TRUE)

# Fiyat Oluşturma
fiyat <- rnorm(100, mean = 50, sd = 10)

# Miktar Oluşturma
miktar <- sample(1:10, 100, replace = TRUE)

# Satış Tarihi Oluşturma
satis_tarihi <- as.Date(sample(Sys.Date() - 365:0, 100, replace = TRUE))

# Veri Setinin Oluşturulması
veri <- data.frame(musteri_id, urun_id, urun_adi, fiyat, miktar, satis_tarihi)

# Veri setinin genel yapısını inceleme
str(veri)

# Veri setinin ilk 5 satırını görüntüleme
head(veri)

# Veri setinin son 5 satırını görüntüleme
tail(veri)

# Veri setindeki değişkenlerin isimlerini listeleme
names(veri)

# Veri setindeki her değişkenin veri türünü görüntüleme
sapply(veri, class)

# Eksik değerlerin oranını kontrol etme
colMeans(apply(veri, 1, is.na))

# Ürün Fiyatlarının Dağılımı
hist(veri$fiyat)

# Ürün Miktarlarının Dağılımı
hist(veri$miktar)

# Satış Tarihlerinin Dağılımı
boxplot(veri$satis_tarihi)

# En Çok Satılan Ürünlerin Frekans Tablosu
table(veri$urun_adi)

# Müşteri Harcamalarının Dağılımı (Müşteri Başına)
ggplot(veri, aes(x = musteri_id, y = sum(fiyat * miktar))) +
  geom_bar(stat = "identity") +
  labs(title = "Müşteri Harcamaları", x = "Müşteri ID", y = "Toplam Harcama")

# Veri setinin güncellenmiş özeti
summary(veri)

# Veri setinin boyutunun kontrol edilmesi
dim(veri)



### Örnek Veri Seti ile Keşifsel Analiz

# Veri setini yükle
data(iris)

# Veri setinin ilk 6 gözlemi
head(iris)

# Veri setinin boyutu
dim(iris)

# Veri setinin yapısal özellikleri
str(iris)

# Eksik değerleri kontrol et
sum(is.na(iris))

# Eksik değerleri işle (örneğin, eksik değerleri ortalama ile doldurma)
iris[is.na(iris)] <- mean(iris, na.rm = TRUE)

# Histogramlar
par(mfrow=c(2,2))
hist(iris$Sepal.Length, main="Sepal Length", col="skyblue")
hist(iris$Sepal.Width, main="Sepal Width", col="pink")
hist(iris$Petal.Length, main="Petal Length", col="lightgreen")
hist(iris$Petal.Width, main="Petal Width", col="lightcoral")

# Kutu grafiği
boxplot(iris, col=c("skyblue", "pink", "lightgreen", "lightcoral"), main="Boxplot of Iris Variables")

# Korelasyon matrisi
cor(iris[,1:4])

# Veri setinin ilk 6 gözlemi
head(iris)

# Veri setinin boyutu
dim(iris)

# Eksik değerleri kontrol et
sum(is.na(iris))
