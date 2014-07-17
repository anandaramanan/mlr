#' @title Create a clustering task.
#' @name ClusterTask
#' @rdname Task
#' @export
makeClusterTask = function(id, data, weights = NULL, blocking = NULL,
  fixup.data = "warn", check.data = TRUE) {
  assertChoice(fixup.data, choices = c("no", "quiet", "warn"))
  assertFlag(check.data)

  task = addClasses(makeUnsupervisedTask("cluster", data, weights, blocking), "ClusterTask")
  if (fixup.data != "no")
    fixupData(task, character(0L), fixup.data)
  if (check.data)
    checkTaskCreation(task)
  id = checkOrGuessId(id, data)
  task$task.desc = makeTaskDesc.ClusterTask(task, id)
  return(task)
}

#' @export
checkTaskCreation.ClusterTask = function(task, ...) {
  NextMethod("checkTaskCreation")
}

#' @export
fixupData.ClusterTask = function(task, target, choice, ...) {
  NextMethod("fixupData")
}

#' @export
makeTaskDesc.ClusterTask = function(task, id) {
  target = character(0L)
  td = makeTaskDescInternal(task, "cluster", id, target)
  return(addClasses(td, "TaskDescCluster"))
}

#' @export
print.ClusterTask = function(x, ...) {
  print.UnsupervisedTask(x)
}