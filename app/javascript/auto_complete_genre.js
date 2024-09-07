document.addEventListener("DOMContentLoaded", function () {
  const genreInput = document.getElementById("genre-input");
  const addGenreBtn = document.getElementById("add-genre-btn");
  const selectedGenresContainer = document.getElementById("selected-genres");
  const suggestionsContainer = document.getElementById("suggestions_container"); // Container to display suggestions


  let selectedGenres = [];

  genreInput.addEventListener("input", async function() {
    const query = genreInput.value.trim().toLowerCase();
    suggestionsContainer.classList.remove('hidden');
    
    try {
      const response = await fetch('/genres/search');
      
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      
      const allGenres = await response.json();
      
      // Filter genres based on the query
      const filteredGenres = allGenres.filter(genre => genre.toLowerCase().includes(query));
      
      // Clear previous suggestions
      suggestionsContainer.innerHTML = '';
      
      // Display filtered genres as suggestions
      filteredGenres.forEach(genre => {
        const div = document.createElement('div');
        div.textContent = genre;
        div.classList.add('suggestion-item');
        div.addEventListener('click', function() {
          genreInput.value = genre;
          suggestionsContainer.innerHTML = ''; // Clear suggestions
        });
        suggestionsContainer.appendChild(div);
      });

    } catch (error) {
      console.error('Error fetching genres:', error);
    }
  });

  addGenreBtn.addEventListener("click", function () {
    const genre = genreInput.value.trim();
    if (genre) {
      addGenre(genre);
      suggestionsContainer.classList.add('hidden');
    }
  });

  function addGenre(genre) {
    if (!selectedGenres.includes(genre)) {
      selectedGenres.push(genre);
      const span = document.createElement("span");
      span.textContent = genre;
      span.classList.add("bg-gray-200", "p-2", "rounded", "mr-2");
  
      selectedGenresContainer.appendChild(span);
      genreInput.value = '';
  
      document.getElementById("hidden-genre-names").value = selectedGenres.join(',');
    }
  }
  
});
