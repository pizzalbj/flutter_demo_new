/// 结合了 pull_to_refresh 1.5.6 的 RefreshStatus 和 LoadStatus
/// 后续版本有变请更改
enum RefreshAndLoadingStatus {
  idle,
  canRefresh,
  refreshing,
  canLoading,
  loading,
  completed,
  noMore,
  failed,
  canTwoLevel,
  twoLevelOpening,
  twoLeveling,
  twoLevelClosing,
}

class StatusEvent {
  String labelId;
  RefreshAndLoadingStatus status;
  int cid;

  StatusEvent(this.labelId, this.status, {this.cid});
}
