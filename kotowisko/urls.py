"""kotowisko URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from kotowisko_app import views
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.Home.as_view()),
    path('blog-list/', views.BlogList.as_view()),
    path('fav/', views.FavoriteView.as_view()),
    path('blog-details/<int:id>/', views.ReadBlog.as_view()),
    path('add-blog/', views.AddBlog.as_view()),
    path('edit-blog/<int:id>/', views.EditBlog.as_view()),
    path('add-article/<int:id_blog>', views.AddArticle.as_view()),
    path('home-user/', views.UserHome.as_view()),
    path('accounts/', include('django.contrib.auth.urls')),
    path('edit-comment/<int:id_blog>',views.AddComment.as_view()),
    path('user-blogs/', views.UserBlogs.as_view()),
    path('blog-delate/<int:id>/',views.DelateBlog.as_view()),
    path('article-delate/<int:id>/',views.DelateArticle.as_view()),
    # path('add-photo/<int:id_blog>', views.AddPhoto.as_view()),
    # path('accounts/logout/', views.Home.as_view())

]
