let timeout;

document.getElementById("search_input").addEventListener("input", function(e) {
  clearTimeout(timeout);

  timeout = setTimeout(() => {
    const searchQuery = e.target.value;

    fetch("/searches", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ user_search: searchQuery })
    });
  }, 800); // só envia 800ms após parar de digitar
});