local delayTimeOfBottom = 0
local delayTimeOfLeft = 0.01

return {
	right = {
		mExploreNode = {
			isSpecial = true,
			close = {
				delayTime = delayTimeOfBottom * 2.5
			},
			open = {
				delayTime = delayTimeOfBottom * 4
			}
		},
		mChallengeNode = {
			close = {
				delayTime = delayTimeOfBottom * 2
			},
			open = {
				delayTime = delayTimeOfBottom * 3
			}
		},
		mArena1Node = {
			close = {
				delayTime = delayTimeOfBottom * 1
			},
			open = {
				delayTime = delayTimeOfBottom * 1.5
			}
		},
		mOpenWorld = {
			close = {
				delayTime = delayTimeOfBottom * 3
			},
			open = {
				delayTime = delayTimeOfBottom * 4.5
			}
		},
		mLabyrinth = {
			close = {
				delayTime = delayTimeOfBottom * 4
			},
			open = {
				delayTime = delayTimeOfBottom * 6
			}
		}
	},
	bottom = {
		mRecruitEquipNode = {
			order = 4,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 3,
				move1 = {
					time = 2,
					py = 0
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 7,
				move1 = {
					time = 2,
					py = 0
				}
			}
		},
		mGuildNode = {
			order = 8,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 1,
				move1 = {
					time = 5,
					py = 0
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 9,
				move1 = {
					time = 5,
					py = 0
				}
			}
		},
		mShopNode = {
			order = 5,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 5,
				move1 = {
					time = 3,
					px = 3
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 7.5,
				move1 = {
					time = 3,
					px = 3
				}
			}
		},
		mLeadNode = {
			order = 1,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 5,
				move1 = {
					time = 3,
					px = 3
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 7.5,
				move1 = {
					time = 3,
					px = 3
				}
			}
		},
		mPhotoNode = {
			order = 7,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 5,
				move1 = {
					time = 5,
					py = 0
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 5,
				move1 = {
					time = 5,
					py = 0
				}
			}
		},
		mCardsGroupNode = {
			order = 3,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 6,
				move1 = {
					time = 10,
					py = 0
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 4,
				move1 = {
					time = 10,
					py = 0
				}
			}
		},
		mServantNode = {
			order = 2,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 7,
				move1 = {
					time = 8,
					py = 0
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 3,
				move1 = {
					time = 8,
					py = 0
				}
			}
		},
		mTaskNode = {
			order = 6,
			close = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 9,
				move1 = {
					time = 5,
					py = 4
				}
			},
			open = {
				fadeInTime = 0.1,
				delayTime = delayTimeOfBottom * 1,
				move1 = {
					time = 5,
					py = 4
				}
			}
		}
	},
	left = {
		mDownNode = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 1,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 1.5,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		},
		mRankNode = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 1,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 1.5,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		},
		mFriendNode = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 2,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 3,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		},
		mBagNode = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 2,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 3,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		},
		mMailNode = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 3,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 4.5,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		},
		mActivity2Node = {
			close = {
				fade = 3,
				delayTime = delayTimeOfLeft * 4,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			},
			open = {
				fade = 3,
				delayTime = delayTimeOfLeft * 6,
				move1 = {
					time = 3,
					px = 3
				},
				move2 = {
					time = 3,
					px = 0
				}
			}
		}
	},
	top = {}
}
