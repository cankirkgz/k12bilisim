<h1>📱 Haber Uygulaması</h1>

<p>
    Bu proje, çeşitli haber ve makaleleri listeleyen, kategorilere göre filtreleme yapabilen 
    ve detay sayfasında içerik görüntülemeye olanak tanıyan mobil bir uygulamadır.
</p>

<hr>

<h2>📌 Proje Amacı</h2>
<p>
    Uygulama, kullanıcıların <strong>haberleri ve makaleleri</strong> okuyabileceği, 
    kategori bazlı filtreleme yapabileceği ve içeriklerin detaylarına ulaşabileceği bir 
    <strong>mobil uygulama</strong> olarak geliştirilmiştir.
</p>
<p>Amacı, içeriklerin daha düzenli bir şekilde listelenmesini sağlamak ve kullanıcı dostu bir okuma deneyimi sunmaktır.</p>

<hr>

<h2>🛠️ Kullanılan Teknolojiler</h2>
<ul>
    <li><strong>Flutter</strong> - Uygulamanın UI (Arayüz) geliştirilmesi için</li>
    <li><strong>GetX</strong> - State Management (Durum Yönetimi) için</li>
    <li><strong>Dio</strong> - API'den veri çekmek için</li>
    <li><strong>REST API</strong> - <code>/posts</code> ve <code>/posts/{id}</code> endpointleri ile veri almak</li>
    <li><strong>MVC Mimarisi</strong> - Model-View-Controller yapısına uygun geliştirme</li>
</ul>

<hr>

<h2>📂 Proje Yapısı</h2>
<p>Proje, <strong>MVC mimarisine</strong> uygun olarak şu şekilde düzenlenmiştir:</p>
<ul>
    <li><code>lib/controllers</code> → GetX ile state management ve iş mantığı</li>
    <li><code>lib/models</code> → Post modelinin tanımlandığı yer</li>
    <li><code>lib/services</code> → API servislerini yöneten katman</li>
    <li><code>lib/views</code> → UI (Kullanıcı Arayüzü) bileşenleri</li>
    <li><code>lib/widgets</code> → Özelleştirilmiş Flutter bileşenleri (Custom Widgets)</li>
    <li><code>lib/routes</code> → Uygulama içi sayfa yönlendirmeleri (GetPage)</li>
</ul>

<hr>

<h2>⚡ Özellikler</h2>
<ul>
    <li>📌 <strong>Post Listeleme</strong> → <code>/posts</code> API’sinden çekilen verileri listeleme</li>
    <li>📌 <strong>Kategori Bazlı Filtreleme</strong> → Kullanıcılar belirli kategorileri seçerek içerikleri filtreleyebilir</li>
    <li>📌 <strong>Arama Fonksiyonu</strong> → Kullanıcılar içerik başlıklarına göre arama yapabilir</li>
    <li>📌 <strong>Detay Sayfası</strong> → Seçilen içeriğin detaylarını gösteren bir sayfa</li>
    <li>📌 <strong>GetX State Management</strong> → UI ve iş mantığını yönetmek için kullanılır</li>
    <li>📌 <strong>Random Pastel Renkler</strong> → Her içeriğe sabit ama rastgele bir renk atanır</li>
</ul>

<hr>

<hr>

<h2>📷 Ekran Görüntüleri</h2>
<p>Uygulama ile ilgili bazı ekran görüntüleri aşağıda bulunmaktadır.</p>

<img src="https://github.com/user-attachments/assets/4076323e-c5fd-4654-8468-dee66112b889" alt="Uygulama Ekran Görüntüsü1" width="200">
<img src="https://github.com/user-attachments/assets/34b546da-bb77-4169-a19c-20d4f25fad30" alt="Uygulama Ekran Görüntüsü2" width="200">
<img src="https://github.com/user-attachments/assets/9745f242-5651-4145-b202-ff0173db10e5" alt="Uygulama Ekran Görüntüsü3" width="200">

<hr>
</body>
</html>
