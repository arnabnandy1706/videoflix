from django.shortcuts import render
from .models import Video
from django.db.models import Q

# Create your views here.

def index(request):
  videos = Video.objects.all() 
  return render(request, 'index.html', {'videos':videos})
  
def search(request):
  search_term = ''
  query = request.GET.get('search')
  results = Video.objects.filter(Q(name__icontains=query))
  return render(request, 'index.html', {'videos':videos, 'results': results})
  #if 'search' in request.GET:
    #search_term = request.GET['search']

    #video = Video.objects.filter(name__icontains=search_term)

  #return render(request, 'index.html', {'videos':videos, 'search_term': search_term})
