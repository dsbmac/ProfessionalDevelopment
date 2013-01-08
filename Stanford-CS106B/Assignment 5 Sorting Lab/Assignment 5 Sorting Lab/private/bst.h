/*
 * File: private/bst.h
 * Last modified on Fri Jun  5 15:40:43 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the bst.h interface.
 * This portion of the class definition is taken out of the bst.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Class: BST<ElemType>::Iterator
 * ------------------------------
 * This interface defines a nested class within the BST template that
 * provides iterator access to the keys contained in the BST.
 */

	class Iterator {
	public:
		Iterator();
		bool hasNext();
		ElemType next();

	private:
		struct iteratorMarkerT {
			void *np;
			bool processed;
		};

		Iterator(BST *bstp);
		BST *bstp;
		Stack<iteratorMarkerT> stack;
		long timestamp;
		void advanceToNextNode();
		void findLeftmostChild();
		friend class BST;
	};
	friend class Iterator;
	ElemType foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return trees by value
 * and assign from one tree to another. The entire contents of
 * the tree, including all elements, are copied. Each tree
 * element is copied from the original tree to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, trees are typically passed
 * by reference, however, when a copy is needed, these operations
 * are supported.
 */
	const BST & operator=(const BST & rhs);
	BST(const BST & rhs);

private:

/* Type definition for node in the tree */
	struct nodeT {
		ElemType data;
		nodeT *left, *right;
		int bf;    /* AVL balance factor */
	};

/* Constant definitions */
	static const int BST_RIGHT_HEAVY = +1;
	static const int BST_IN_BALANCE = 0;
	static const int BST_LEFT_HEAVY = -1;

/* Instance variables */
	nodeT *root;
	int numNodes;
	long timestamp;
	int (*cmpFn)(ElemType, ElemType);

/* Private method prototypes */
	nodeT *recFindNode(nodeT *t, ElemType & key);
	bool recAddNode(nodeT * & t, ElemType & key, bool & createdNewNode);
	bool recRemoveNode(nodeT * & t, ElemType & key, bool & didRemove);
	bool removeTargetNode(nodeT * & t);
	void updateBF(nodeT * & t, int bfDelta);
	void recDeleteTree(nodeT *t);
	void recBSTAll(nodeT *t, void (*fn)(ElemType));
	void fixRightImbalance(nodeT * & t);
	void fixLeftImbalance(nodeT * & t);
	void rotateRight(nodeT * & t);
	void rotateLeft(nodeT * & t);
	void copyOtherEntries(const BST & other);

/* Template method prototypes */

	template <typename ClientDataType>
	void recBSTAll(nodeT *t, void (*fn)(ElemType, ClientDataType &),
	               ClientDataType & data);
