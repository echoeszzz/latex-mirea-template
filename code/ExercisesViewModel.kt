package com.echoeszzz.gobeyond.ui.exercises

import androidx.annotation.StringRes
import androidx.compose.material3.SnackbarHostState
import androidx.compose.runtime.Stable
import androidx.compose.ui.platform.UriHandler
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.echoeszzz.gobeyond.R
import com.echoeszzz.gobeyond.data.StringHandler
import com.echoeszzz.gobeyond.data.model.Exercise
import com.echoeszzz.gobeyond.data.model.MuscleGroups
import com.echoeszzz.gobeyond.data.repository.ExerciseRepo
import com.echoeszzz.gobeyond.utils.asStateFlow
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ExercisesViewModel @Inject constructor(
    private val repo: ExerciseRepo,
    private val uriHandler: UriHandler,
    private val stringHandler: StringHandler,
) : ViewModel() {

    // null -> all
    private val selectedTarget: MutableStateFlow<MuscleGroups?> = MutableStateFlow(null)
    val searchQuery: MutableStateFlow<String> = MutableStateFlow("")
    private val exercisesStream: Flow<List<Exercise>> = repo.stream

    val snackbarState = SnackbarHostState()

    val exercises: StateFlow<ExercisesUiState> = combine(
        exercisesStream,
        selectedTarget,
        searchQuery
    ) { exercises, target, query ->
        val filteredExercises = exercises.filter {
            (target == null || it.target == target) && (query.isEmpty() || it.name.contains(query, ignoreCase = true))
        }
        ExercisesUiState(
            exercises = filteredExercises,
            selected = target,
        )
    }.asStateFlow(ExercisesUiState())


    fun removeExercise(name: String) {
        viewModelScope.launch {
            repo.remove(name)
        }
    }

    fun setTarget(value: MuscleGroups?) {
        viewModelScope.launch {
            selectedTarget.emit(value)
        }
    }

    fun updateSearchQuery(query: String) {
        viewModelScope.launch {
            searchQuery.emit(query)
        }
    }

    fun onReferenceClick(reference: String) {
        viewModelScope.launch {
            try {
                uriHandler.openUri(reference)
            } catch (e: IllegalStateException) {
                snackbarState.showSnackbar(
                    e.message ?: stringHandler.getString(R.string.error_invalid_url)
                )
            }
        }
    }
}

val MuscleGroups?.string: Int
    @StringRes
    get() = this?.stringRes ?: R.string.label_all_muscle_groups

@Stable
class ExercisesUiState(
    val exercises: List<Exercise> = emptyList(),
    val selected: MuscleGroups? = null,
)