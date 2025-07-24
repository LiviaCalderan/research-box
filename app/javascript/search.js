let timeout;

function handleInput(event) {
  clearTimeout(timeout);

  timeout = setTimeout(() => {
    const searchQuery = event.target.value.trim();

    if (searchQuery.length > 3) {
      fetch("/searches", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document
            .querySelector("meta[name='csrf-token']")
            .getAttribute("content"),
        },
        body: JSON.stringify({ user_search: searchQuery }),
      });
    }
  }, 800);
}

function setupSearch() {
  const searchInput = document.getElementById("search-input");
  if(!searchInput) return;

  searchInput.removeEventListener("input", handleInput);
  searchInput.addEventListener("input", handleInput);
}

document.addEventListener("DOMContentLoaded", setupSearch);