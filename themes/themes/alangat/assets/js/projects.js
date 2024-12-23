document.addEventListener('DOMContentLoaded', function() {
    const projectsGrid = document.getElementById('projects-grid');
    const filterTags = document.querySelectorAll('.filter-tag');
    let activeFilters = {
        tag: [],
        tech: []
    };

    // Filter projects based on active filters
    function filterProjects() {
        const projects = projectsGrid.querySelectorAll('.project-card');
        
        projects.forEach(project => {
            let showProject = true;
            
            // Check tag filters
            if (activeFilters.tag.length > 0) {
                const projectTags = project.dataset.tags.split(',');
                const hasMatchingTag = activeFilters.tag.some(tag => 
                    projectTags.includes(tag)
                );
                if (!hasMatchingTag) {
                    showProject = false;
                }
            }
            
            // Check technology filters
            if (activeFilters.tech.length > 0 && showProject) {
                const projectTechs = project.dataset.techs.split(',');
                const hasMatchingTech = activeFilters.tech.some(tech => 
                    projectTechs.includes(tech)
                );
                if (!hasMatchingTech) {
                    showProject = false;
                }
            }
            
            // Show or hide the project with animation
            if (showProject) {
                project.style.display = '';
                project.classList.add('fade-in');
                project.classList.remove('fade-out');
            } else {
                project.classList.add('fade-out');
                project.classList.remove('fade-in');
                setTimeout(() => {
                    if (project.classList.contains('fade-out')) {
                        project.style.display = 'none';
                    }
                }, 300);
            }
        });

        updateFilterTags();
        checkEmptyState();
    }

    // Update active filter tags appearance
    function updateFilterTags() {
        filterTags.forEach(tag => {
            const filterType = tag.dataset.filter;
            const filterValue = tag.dataset.value;
            
            if (activeFilters[filterType].includes(filterValue)) {
                tag.classList.add('active');
            } else {
                tag.classList.remove('active');
            }
        });
    }

    // Show message if no projects match filters
    function checkEmptyState() {
        const visibleProjects = projectsGrid.querySelectorAll('.project-card:not([style*="display: none"])');
        const emptyMessage = document.getElementById('empty-message');
        
        if (visibleProjects.length === 0) {
            if (!emptyMessage) {
                const message = document.createElement('div');
                message.id = 'empty-message';
                message.className = 'empty-state';
                message.textContent = 'No projects match the selected filters.';
                projectsGrid.appendChild(message);
            }
        } else if (emptyMessage) {
            emptyMessage.remove();
        }
    }

    // Handle filter tag clicks
    filterTags.forEach(tag => {
        tag.addEventListener('click', () => {
            const filterType = tag.dataset.filter;
            const filterValue = tag.dataset.value;
            
            const index = activeFilters[filterType].indexOf(filterValue);
            if (index === -1) {
                activeFilters[filterType].push(filterValue);
            } else {
                activeFilters[filterType].splice(index, 1);
            }
            
            filterProjects();
        });
    });
});